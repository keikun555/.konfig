#!/bin/bash

source globals.sh
python3 $BUNDLE_DIR/YouCompleteMe/install.py --clang-completer --java-completer --ts-completer
