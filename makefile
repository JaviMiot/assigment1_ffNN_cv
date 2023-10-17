.PHONY: run
run:
	sbatch job.sh

.PHONY: list
list:
	squeue
