#
# This file is part of the Air Force Institute of Technology (AFIT) 
# Resilient Sensor Grid (RSG) Extract, Transform, Load (ETL) Tool.
#
# Written by:
#               Ryan D. L. Engle
#               ryan.engle@afit.edu, rdengle@gmail.com
#               Air Force Institute of Technology
#               Department of Systems Engineering & Management (ENV)
#               2950 Hobson Way
#               Wright Patterson AFB, Ohio  45433-7765  USA
#
# This source code is property of the United States Government.
#
# NO PART OF THIS PROGRAM MAY BE COPIED, REPRODUCED, OR DUPLICATED WITHOUT
# THE EXPRESSED WRITTEN PERMISSION FROM AFIT/ENV.
#
# # This software is provided "AS IS" and the author disclaims all warranties with 
# regard to this software. In no event shall the author be liable for any indirect 
# or consequential damages arising out of, or in connection with, the use of this 
# software. USE AT YOUR OWN RISK.
#
# Last Modified: 2020 0210 2032
import os

csvList = []
for root, subdirs, files in os.walk('data', topdown=True):
    #for name in files:
        #csvList.append(os.path.join(root, name))
        #print(os.path.join(root, name))

   for name in subdirs:
        csvList.append(os.path.join(root, name))
        #print(os.path.join(root, name))

for csv in csvList:
    print csv