#!bin/bash

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p conda
conda/bin/conda create --name framework python=3.10

export PATH=~/conda/envs/framework/bin:~/conda/bin:$PATH
source activate framework