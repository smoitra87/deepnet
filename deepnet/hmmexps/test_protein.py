from hmmlearn import hmm
import numpy as np
import matplotlib.pyplot as plt
from sklearn.utils.extmath import logsumexp


plt.ion()

class Metrics(object):
    def __init__(self):
        pass

def cross_entropy(h, seq, posterior):
    return -np.log(np.dot(posterior, h.emissionprob_)[np.arange(len(seq)),seq]).sum()

def accuracy(h, seq, posterior):
    return (np.dot(posterior, h.emissionprob_).argmax(axis=1) == seq).mean()

def _infer_markov_blanket(h,seq):
    framelogprob = h._compute_log_likelihood(seq)
    logprob, fwdlattice = h._do_forward_pass(framelogprob) 
    bwdlattice = h._do_backward_pass(framelogprob)
    gamma = fwdlattice + bwdlattice - framelogprob
    posteriors = np.exp(gamma.T - logsumexp(gamma, axis=1)).T
    posteriors += np.finfo(np.float32).eps
    posteriors /= np.sum(posteriors, axis=1).reshape((-1, 1))
    return posteriors

def pll(h, seq):
    posteriors = _infer_markov_blanket(h,seq)
    return -cross_entropy(h, seq, posteriors)
    
def impute_accuracy(h, seq):
    posteriors = _infer_markov_blanket(h,seq)
    return accuracy(h, seq, posteriors)

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Runs HMM experiments for a given protein alignment")
    parser.add_argument("--train",type=str,help="Train .npy alignment file")
    parser.add_argument("--valid",type=str,help="Valid .npy alignment file")
    parser.add_argument("--test",type=str,help="Test .npy alignment file")
    parser.add_argument("--outf",type=str,help="Output .pkl alignment file")

    parser.add_argument("--nstates_hid",type=int,help="Number of states for hidden layer variables",\
            default=2)
    args = parser.parse_args()
    
    train = np.load(args.train)
    valid = np.load(args.valid)
    test = np.load(args.test)

    # Train the HMM
    print "Training HMM..."
    h = hmm.MultinomialHMM(n_components=args.nstates_hid)
    h._init(train, params='ste')
    h.fit(train)

    # Get validation score
    metrics = {}
    for dat in ['train','valid','test']:
        print "Calculating scores for " + dat + "..."
        metrics[dat] = Metrics()
        data = eval(dat)
        metrics[dat].logProb = np.mean([h.score_samples(seq)[0] for seq in data])
        metrics[dat].cross_entropy = \
                np.mean([cross_entropy(h, seq, h.score_samples(seq)[1]) for seq in data])
        metrics[dat].accuracy = \
                np.mean([accuracy(h, seq, h.score_samples(seq)[1]) for seq in data])
        metrics[dat].pll = np.mean([pll(h, seq) for seq in data])
        metrics[dat].impute_accuracy = np.mean([impute_accuracy(h, seq) for seq in data])

    for k in metrics : 
        print k, 'Cross Entropy:', str(metrics[k].cross_entropy)
        print k, 'Accuracy:', str(metrics[k].accuracy)
        print k, 'logProb:', str(metrics[k].logProb)
        print k, 'PLL:', str(metrics[k].pll)
        print k, 'impute_accuracy:', str(metrics[k].impute_accuracy)


    # Get pickle file
    print("Writing model and metrics to " + args.outf + "...")
    with open(args.outf,'wb') as fout:
        import pickle
        pickle.dump({'model' : h, 'metrics' : metrics, 'args': args}, fout)



    


    
    
