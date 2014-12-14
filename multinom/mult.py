import numpy as np

#-----------------------------------------
# VMF model
class Metrics(object):
    def __init__(self):
        pass


from collections import Counter

class Multinomial(object):
    def __init__(self, train, n_states=21):
        self.vmf = [dict(Counter(row)) for row in train.T]
        self.n_states = n_states
        self.vmf = [dict([(k,(d.get(k,0)+1.0)/(n_states+sum(d.values())))\
                for k in  range(n_states)]) for d in self.vmf ]

    def cross_entropy(self, batch) : 
        probs = [[v[aa] for v,aa in zip(self.vmf,seq)] for seq in batch ]
        cent = -(np.log(probs).sum(axis=1).mean())
        return cent

    def logProb(self, batch):
        return -self.cross_entropy(batch)

    def accuracy(self, batch):
       return np.mean([sum(v[aa] >= max(v.values()) for v,aa in \
           zip(self.vmf,seq)) for seq in batch ])

    def pll(self, batch):
       return self.logProb(batch)

    def impute_accuracy(self, batch):
        return self.accuracy(batch)

if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Runs HMM experiments for a given protein alignment")
    parser.add_argument("--train",type=str,help="Train .npy alignment file")
    parser.add_argument("--valid",type=str,help="Valid .npy alignment file")
    parser.add_argument("--test",type=str,help="Test .npy alignment file")
    parser.add_argument("--outf",type=str,help="Output .pkl alignment file")
    parser.add_argument("--nstates",type=int,help="Number of states",default=21)
    args = parser.parse_args()
   
    # Load the data
    train = np.load(args.train)
    valid = np.load(args.valid)
    test = np.load(args.test)

    # Train the model
    mult = Multinomial(train, n_states = args.nstates)

    # Get validation score
    metrics = {}
    for dat in ['train','valid','test']:
        print "Calculating scores for " + dat + "..."
        metrics[dat] = Metrics()
        data = eval(dat)
        metrics[dat].logProb = mult.logProb(data)
        metrics[dat].cross_entropy = mult.cross_entropy(data)
        metrics[dat].accuracy = mult.accuracy(data)
        metrics[dat].pll = metrics[dat].logProb
        metrics[dat].impute_accuracy = metrics[dat].accuracy

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
        pickle.dump({'model' : mult, 'metrics' : metrics, 'args': args}, fout)

