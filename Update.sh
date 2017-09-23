#!/bin/bash
git add .
git commit -m "CHRISTOPHER"
git pull origin blog
hexo clear && hexo g && hexo d
