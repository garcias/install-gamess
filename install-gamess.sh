#!/bin/bash

# $1 is the absolute path to the archive of built GAMESS
# typically named "gamess-built.tar.gz"
if [ -b $1 ]
  then
    echo "Exit. $1 does not exist"
    exit 1
fi

# Install dependencies
sudo apt-get install -y gfortran libblas-dev libatlas-base-dev csh

# Install Java runtime, Jmol, and OpenBabel
sudo apt-get install -y default-jre jmol openbabel

tar -xzf $1 gamess
mv gamess/ ~
cd ~/gamess
mkdir ~/tmp

# Run tests and report output
./runall 00 >& runall.log
grep -i --color 'terminated normally' exam*.log > exam-report.log
NUM_PASSED=$(cat exam-report.log | wc -l)
echo "GAMESS passed $NUM_PASSED of 47 tests"
echo "Check exam-report.log for list of failed tests"

# Clean up tmp directory in case of failure
rm ~/tmp/exam??.*

echo "PATH=$PATH:~/gamess" >> ~/.bashrc

# Manual configuration
echo "=================================================="
echo "  GAMESS installed"
echo "  Added ~/gamess to PATH in .bashrc"
echo "  source ~/.bashrc before using gamess"
echo "=================================================="