from deepnet import util
import os, sys
import glob
from collections import defaultdict
from collections import namedtuple
from itertools import product
from deepnet import markup
from operator import itemgetter
import webbrowser

output_directories = ['dbm_BEST']
output_file_suffixes = ['BEST', 'LAST']


def walk_dir(dirpath):
    model_paths = defaultdict(list)
    for root, dirs, files in os.walk(dirpath):
        for f,suffix in product(files, output_file_suffixes) :
            if f.endswith(suffix): 
                model_paths[suffix].append(os.path.join(root, f))
    return dict(model_paths) 

def make_table(page, rows, header=None):
    """ Make an HTML table for a markup page """
    page.table(border=1)
    page.tr()
    page.th(header)
    page.tr.close()
    for row in rows:
        page.tr()
        page.td(row)
        page.tr.close()
    page.table.close()

def encode_html_rows(rows, header):
    """ Encode rows into html """
    page = markup.page()
    page.h2("Job Table")
    page.init("Job Table")
    make_table(page, rows, header= header)
    return page.__str__()

def display_html(rows, header, launch_browser=False):
    """ Display all table results """
    html = encode_html_rows(rows, header)

    outf = os.path.join("/tmp", os.urandom(16).encode('hex')+".html")
    with open(outf, 'w') as fout:
        fout.write(html)
    
    if launch_browser:
        webbrowser.open(outf, new=2)

DisplayRecord = namedtuple('DisplayRecord', 'model_name, dataset, sparsity, dropout, '+ \
        'input_width, hidden1_width, hidden2_width, epsilon, l2_decay, '+\
        'initial_momentum, final_momentum, expid')


def create_display_row(expid, model, op):
    hyperparams =  model.hyperparams

    record = []
    record.append(model.name)
    record.append(op.data_proto_prefix.split("/")[-1])
    record.append(hyperparams.sparsity)
    record.append(hyperparams.dropout)
    
    for layer_name in ('input_layer', 'hidden1', 'hidden2'):
        try:
            layer = next(l for l in model.layer if l.name == layer_name)
            record.append(layer.dimensions)
        except StopIteration:
            record.append("None")
    record.append("{:.4f}".format(hyperparams.base_epsilon))
    record.append("{:.4f}".format(hyperparams.l2_decay))
    record.append("{:.4f}".format(hyperparams.initial_momentum))
    record.append("{:.4f}".format(hyperparams.l2_decay))
    record.append(expid)
    
    return record
#    return DisplayRecord(*map(str, record))

def get_field_idx(name):
    return next(idx for (idx, field) in enumerate(DisplayRecord._fields) if field == name)

def sort_by_fields(records, fieldnames = []):
    idxs = map(get_field_idx, fieldnames)
    
    selected_fields = [tuple([r[idx] for idx in idxs]) for r in records]
    sorted_idxs = [idx for (idx,_) in sorted(enumerate(selected_fields), key= itemgetter(1))]

    return [records[idx] for idx in sorted_idxs]


if __name__ == '__main__':  
    from argparse import ArgumentParser
    parser = ArgumentParser(description='Parses results by walking directories')
    args = parser.parse_args()
    model_paths = walk_dir('.')
    exp_paths = defaultdict(list)

    get_expid = lambda f : f.split("/")[1]
    get_model = lambda f : util.ReadModel(f)
    get_op = lambda f : util.ReadOperation(f)

    for path in model_paths['BEST']:
        exp_paths[get_expid(path)].append(path)
    exp_paths = dict(exp_paths)

    rows = []
    for exp in exp_paths:
        models = defaultdict(list)
        for f in exp_paths[exp] :
           model_name = os.path.basename(f).split('_')[0]
           models[model_name].append(f)
        models = dict(models)
        for name, (model_file, op_file) in models.items():
            if 'train' in model_file : model_file,op_file = op_file, model_file
            row = create_display_row(exp, util.ReadModel(model_file), util.ReadOperation(op_file))
            rows.append(row)

        rows = sort_by_fields(rows, fieldnames=['model_name'])
        display_html(rows, DisplayRecord._fields, launch_browser=True) 
        # ---  BREAKPOINT --- 
        import ipdb; ipdb.set_trace() 
    
