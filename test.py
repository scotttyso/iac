#!/usr/bin/env python3

import git
import os
from git import Repo

repo = Repo('./')
lastCommit = repo.head.commit.committed_date

uncommittedFiles = []
subdirs = [x[0] for x in os.walk('.')]
d = '.'
subdirs = [os.path.join(d, o) for o in os.listdir(d) if os.path.isdir(os.path.join(d,o))]
print(subdirs)
files = os.listdir('./')
print(files)
for file in files:
    if os.path.getmtime('./' + "/" + file) > lastCommit:
        uncommittedFiles.append(file)
uncommittedFiles = uncommittedFiles.remove(".git")
print(uncommittedFiles)