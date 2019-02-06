#!/bin/bash
# Goal:
# Fot YouComplete, we should complie it After installing, or we can't use it usually.

# Fot Ubuntu 16.04 and later:
sudo apt install build-essential cmake python3-dev

vimBundleDir=$HOME/.vim/bundle
cd vimBundleDir/YouCompleteMe
python3 install.py --clang-complter --ts-completer

# Notice: if you want to install java, you should use network proxy
