#!/bin/bash
cd
cd blog
git init
git add .
git commit -m "CHRITOPHER"
git branch blog
git checkout blog
git remote add origin git@github.com:ljf-cnyali/code.git
git push origin blog
