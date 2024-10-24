#!/bin/bash
#SBATCH --account=GOV113078           # (-A) iService Project ID
#SBATCH --job-name=python-mpi         # (-J) Job name
#SBATCH --partition=development       # (-p) Slurm partition
#SBATCH --nodes=2                     # (-N) Maximum number of nodes to be allocated
#SBATCH --cpus-per-task=1             # (-c) Number of cores per MPI task
#SBATCH --ntasks-per-node=2         # Maximum number of tasks on each node
#SBATCH --time=00:30:00               # (-t) Wall time limit (days-hrs:min:sec)
#SBATCH --output=job-%j.out           # (-o) Path to the standard output file
#SBATCH --error=job-%j.err            # (-e) Path to the standard error filei

module purge
module load gcc/8.5.0
module load openmpi/5.0.2
module load tools/miniconda3

eval "$(conda shell.bash hook)"
conda activate <YOUR_ENV>
mpiexec -n $SLURM_NTASKS python3 <YOUR_PYTHON.py>
