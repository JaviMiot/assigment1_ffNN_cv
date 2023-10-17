#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --job-name=example
#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=standard-gpu
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=8G
##------------------------ End job description ------------------------
##-------------------------- Start execution --------------------------
srun python file.py
##--------------------------- End execution ---------------------------