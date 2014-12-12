"""Sets the data path and output paths in trainers."""
from deepnet import util
from google.protobuf import text_format
import os.path
import sys

def MakeDataPbtxt(data_pbtxt_file, data_path):
  data_pbtxt = util.ReadData('toy.pbtxt')
  for data in data_pbtxt.data:
    fname = os.path.basename(data.file_pattern)
    data.file_pattern = os.path.join(data_path, fname)
  util.WritePbtxt(data_pbtxt_file, data_pbtxt)

def MakeTrainers(trainer_file, data_pbtxt_file, output_path):
  trainer = util.ReadOperation(trainer_file)
  trainer.data_proto = data_pbtxt_file 
  trainer.checkpoint_directory = output_path
  util.WritePbtxt(trainer_file, trainer)

def EditPretrainedModels(p, output_path):
  pm = []
  for m in p.pretrained_model:
    fname = os.path.basename(m)
    pm.append(os.path.join(output_path, fname))
  if pm:
    del p.pretrained_model[:]
    p.pretrained_model.extend(pm)

def MakeModels(model_file, output_path):
  model = util.ReadModel(model_file)
  for l in model.layer:
    for p in l.param:
      EditPretrainedModels(p, output_path)
  for e in model.edge:
    for p in e.param:
      EditPretrainedModels(p, output_path)
  util.WritePbtxt(model_file, model)

def main():
  data_path = os.path.abspath(sys.argv[1])  # Path to mnist data directory.
  output_path = os.path.abspath(sys.argv[2])  # Path where learned models will be written.

  data_pbtxt_file = os.path.join(data_path, 'toy.pbtxt')
  MakeDataPbtxt(data_pbtxt_file, data_path)

  for model in ['rbm']:
    trainer_file = os.path.join(model, 'train_toy.pbtxt')
    MakeTrainers(trainer_file, data_pbtxt_file, output_path)


  model_files = [
    os.path.join('rbm', 'model_toy.pbtxt')
  ]
  for model_file in model_files:
    MakeModels(model_file, output_path)

if __name__ == '__main__':
  main()
