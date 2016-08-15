#!/bin/bash

# Assumes that gamess-built.tar.gz is in repository directory

INSTALL_DIR=~

# update and install dependencies
sudo apt-get update -qq
sudo apt-get install -y gfortran libblas-dev libatlas-base-dev csh

# Extract the gamess directory
tar -xzf gamess-built.tar.gz
mv gamess/ $INSTALL_DIR/
cd $INSTALL_DIR/gamess

# Run tests and report output
./runall 00 >& runall.log
grep -i --color 'terminated normally' exam*.log
NUM_PASSED=$(grep -i --color 'terminated normally' exam*.log | wc -l)
echo "GAMESS passed $NUM_PASSED of 47 tests"

# Clean up gamess directory of test files
rm exam??.log
rm /tmp/exam??.*

echo "PATH=$PATH:~/gamess" >> ~/.bashrc

# Manual configuration
echo "=================================================="
echo "  GAMESS installed"
echo "  Added ~/gamess to PATH in .bashrc"
echo "  source ~/.bashrc before using gamess"
echo "=================================================="