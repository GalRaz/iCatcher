#!/bin/bash

# submit array of jobs to run icatcher individually for all videos in video_dir specified below

# example usage: 
# ./run_icatcher_job_array.sh 


project_path="/nese/mit/group/saxelab/users/galraz/icatcher_tests/"
video_dir="$project_path/iCatcher/videos/"


videos=( $(find $video_dir/ -type f -name "*.mp4") )
len=$(expr ${#videos[@]} - 1) 

cmd="sbatch --array=0-$len $project_path/iCatcher/run_icatcher.sh ${videos[@]}"

echo $cmd
echo $len
$cmd

