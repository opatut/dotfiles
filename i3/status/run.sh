#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source ./.pyenv/bin/activate
[-f ~/.passwords] && source ~/.passwords
python init.py
