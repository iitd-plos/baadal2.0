#!/bin/bash

cd /home/www-data/web2py
su www-data -c "python web2py.py -S baadal -M -R applications/baadal/private/dc_down_baadal.py"
