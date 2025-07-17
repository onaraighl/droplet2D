#!/bin/bash -l
#SBATCH --job-name=long1
# speficity number of nodes 
#SBATCH -N 1

# specify number of tasks/cores per node required
#SBATCH --ntasks-per-node 24

# specify the walltime e.g 20 mins
#SBATCH -t 24:00:00

# set to email at start,end and failed jobs
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lennon.onaraigh@ucd.ie

# run from current directory
cd $SLURM_SUBMIT_DIR

# Load Module
module load openfoam/2306
source /opt/software/openfoam/2306/etc/bashrc

# set-up from prepare file
cd /home/people/lonarai/gas_liquid_2025/long1_sonic/case

# run on parallel with 24 cores
decomposePar
mpirun -np 24 interFoam -parallel

hostname
