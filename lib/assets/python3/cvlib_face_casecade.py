#!/usr/bin/env python
# coding: utf-8

# In[4]:


# import necessary packages
import cvlib as cv
import cv2
import time
import about_cascade_face_seprate as cs
import sys
#절대 경로 복사
#lib/assets/python3/sample.mp4

dir = "/home/kh/video_project/lib/assets/python3/"
save_dir ="/home/kh/video_project/public/"
print("make ratio video...")
file_id=sys.argv[1]
file_name=sys.argv[2]
print("전달받은 파일 정보 ID : " + file_id)
print("전달받은 파일 이름 : " + file_name)
start = time.time()  # 시작 시간 저장
# open webcam
select_video = '/home/kh/video_project_rest_api/lib/assets/python3/sample.mp4'
file_name_a = file_name.split(".") 
ratio_file =  "ratio_" + str(file_id) + "." + file_name_a[1]

select_video = "/home/kh/video_project/public/uploads/save_video/file_name/" + str(file_id) + "/" + file_name
ratio_video = "/home/kh/video_project/public/" + str(file_id) + "/" + ratio_file
print("선택된 비디오 경로 :"  + select_video)
print("처리 후 저장될 비디오 경로 :"  + save_dir + ratio_file)
cs.video_make_ratio(save_dir + ratio_file, select_video)
print("time :", time.time() - start)  # 현재시각 - 시작시간 = 실행 시간 
print("result_video_path_sp"+ save_dir + ratio_file)


# In[ ]:




