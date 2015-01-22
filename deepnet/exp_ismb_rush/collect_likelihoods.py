import os,sys
import copy
import pickle
import glob
import scipy.io as sio
import numpy as np



if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Creates CSV from pkl files")
    parser.add_argument("--globstr",type=str, help='globstring')
    parser.add_argument("--outf",type=str, help='outf')
    args = parser.parse_args()

    files = glob.glob(args.globstr)

    headers = ['expid', 'model_name', 'train-ll','valid-ll', 'test-ll'] + \
            ['train-pll', 'valid-pll', 'test-pll'] + \
            ['train-imperr', 'valid-imperr', 'test-imperr']

    records = []
    template_metric = {}
    for t in ('train', 'valid', 'test'):
            template_metric['{}-ll'.format(t)] = None
            template_metric['{}-pll'.format(t)] = None
            template_metric['{}-imperr'.format(t)] = None


    metric_dict = {}
    for fname in files:

        base_key = os.path.splitext(os.path.basename(fname))[0]
        base_key = "_".join(base_key.split("_")[:-1])
        expid, model_name = base_key.split("_")

        with open(fname, 'rb') as fin:
            results = pickle.load(fin)

        if (expid, model_name) not in metric_dict:
            metric_dict[(expid, model_name)] = copy.deepcopy(template_metric)
            metric_dict[(expid, model_name)]['expid'] = expid
            metric_dict[(expid, model_name)]['model_name'] = model_name

        if 'model' in results:
            Z = results['model'].mean()

            for t in ('train', 'valid', 'test'):
                Zv = results['data'][t].mean()
                ll = Zv - Z
                metric_dict[(expid, model_name)]['{}-ll'.format(t)] = ll
        else:
            for t in ('train', 'valid', 'test'):
                pll = results['pll'][t]
                metric_dict[(expid, model_name)]['{}-pll'.format(t)] = pll.mean()

                if t in results['imperr'] :
                    imperr = results['imperr'][t]
                    metric_dict[(expid, model_name)]['{}-imperr'.format(t)] = imperr.mean()


    for (expid, model_name) in metric_dict:
        record = [metric_dict[(expid, model_name)][h] for h in headers]
        records.append(record)

    import csv

    if not args.outf :
        raise ValueError("outf missing")

    with open(args.outf, 'wb') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(headers)
        for record in records:
            writer.writerow(record)








