#!/usr/bin/env python3

import os
import datetime as dt

now = dt.datetime.now()
ago = now-dt.timedelta(minutes=120)

for root, dirs,files in os.walk('.'):  
    for fname in files:
        path = os.path.join(root, fname)
        st = os.stat(path)    
        mtime = dt.datetime.fromtimestamp(st.st_mtime)
        if mtime > ago:
            if not '.git' in path and '.tf' in path:
                # print('%s modified %s' % (path, mtime))
                print(os.path.dirname(path))
