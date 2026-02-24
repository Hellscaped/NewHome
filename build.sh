#!/usr/bin/bash
git pull
hugo
rsync -av public/ ~/web