#!/bin/bash

file_id=$1
file_name=$2

echo "python convert to ratio script run"

echo "end cmd"

echo $(python3 /home/kh/video_project/lib/assets/python3/cvlib_face_casecade.py $file_id $file_name)

# python3 /home/kh/video_project/lib/assets/python3/cvlib_face_casecade.py $file_id $file_name

#python3 /home/kh/video_project_rest_api/lib/assets/python3/test.py

exit
