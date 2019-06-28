#!/bin/bash

set -x

pyenv install 3.7.0
pyenv global 3.7.0

python -m pip install natsort
python -m pip install xmltodict
