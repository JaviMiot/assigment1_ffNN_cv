.PHONY: init
init:
	wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh chmod +x miniconda.sh
	chmod +x miniconda.sh
	./miniconda.sh -b -p conda
	conda/bin/conda init bash

.PHONY: env
env:
	conda/bin/conda create --name cvenv python=3.10 -y
	conda activate cvenv
	module load TensorFlow/2.6.0-foss-2021a-CUDA-11.3.1
	pip install -r requirements.txt 

.PHONY: build
build:
	jupyter nbconvert --to script ffNN_example.ipynb --output file


.PHONY: run
run:
	module load TensorFlow/2.6.0-foss-2021a-CUDA-11.3.1 && \
	sbatch job.sh

.PHONY: list
list:
	squeue


.PHONY: load_data
load_data:
	ln -s /home/v839/PROJECT/xview_test/ &&
	ln -s /home/v839/PROJECT/xview_train/ 

.PHONY: dashboard_init
dashboard_init:
	module load TensorFlow/2.6.0-foss-2021a-CUDA-11.3.1 && \
	tensorboard --logdir=logs 

.PHONY: dashboard-view
dashboard-view:
	ssh -L 4000:127.0.0.1:6006 v839330@magerit.cesvima.upm.es

.PHONY: get_logs
get_logs:
	scp -r v839330@magerit.cesvima.upm.es:/home/v839/v839330/nn/logs 'G:\My Drive\2. Capacitaciones\Máster IA\Computer Vision\Assigments\Assigment 2\logs_remote'