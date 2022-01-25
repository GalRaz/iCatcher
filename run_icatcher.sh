#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=galraz@mit.edu
#SBATCH --mem=32GB
#SBATCH --gres=gpu:1
#SBATCH --output=icatcher_output.sh
#SBATCH --time=3:00:00

project_path="/nese/mit/group/saxelab/users/galraz/icatcher_tests/"

videos=($@)
current_video=${videos[${SLURM_ARRAY_TASK_ID}]}

module load openmind/singularity/3.2.0 

singularity exec $project_path/iCatcher/icatch-torch.simg python3 $project_path/iCatcher/icatcher.py --source_type file $current_video --output_annotation $project_path/iCatcher/icatcher_output --output_format raw_output --on_off --model icatcher+

