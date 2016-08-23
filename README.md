# `install-gamess`

Install the General Atomic and Molecular Electronic Structure System (GAMESS) on Ubuntu for simple, single-core runs.

## Quick start

Already have Vagrant and Virtualbox installed, and a copy of `gamess-built.tar.gz` sitting in your `Downloads` folder? 
Then clone this repo, move the archive into the repo directory, and start the VM.

```bash
    $ clone git@github.com:garcias/install-gamess.git
    $ cd install-gamess
    $ mv ~/Downloads/gamess-built.tar.gz ./
    $ vagrant up && vagrant ssh
```

## Whom this is for

Chemistry students can use these files to provision a virtual machine (VM) and install GAMESS, along with visualization software. 
Teachers can build GAMESS for free using the [build-gamess project](https://github.com/garcias/build-gamess) and provide it to their students.

## What this does

The scripts will help you set up a VM, install GAMESS from an archive, and then confirm that it passes standard tests. 
It does this relatively quickly and without need for specialized equipment or software. 
The default configuration is for a single-processor node and only 768 MB of shared memory. 

## What is missing?

GAMESS is available to the public with an *academic* license, not an open-source one. 
*It cannot be distributed publicly.* 
For the scripts to work, someone at your institution (probably your teacher) must first build it from source code and then distribute it to you as an archive named `gamess-built.tar.gz`.

## Why use VMs?

Virtual machines and containers usually incur a performance hit; but they offer the benefit of portability and reproducibility. 
If your teacher can get GAMESS installed properly on their VM, then you can replicate their success by spinning up a VM with the same image. 
The tradeoff between performance and reproducibility is worthwhile in an educational context. 
Another benefit is that software in a VM is isolated from your personal data and personal computing environment, which is desirable when you're using your own personal computer.

Combined with free software, VMs can enable a "distributed" computing lab model. 
Instead of an institution managing a fleet of computers or accounts on a cluster, each student can install and run the software on their own computer or cloud server. 
This project will show two examples: Vagrant + Virtualbox for running a local VM, and the Cloud9 service for running one on a remote server. 
(Maybe someone can adapt this for Digital Ocean, or using Docker containers instead of Vagrant boxes.)

## The bigger picture

This project is part of a broader effort to put computational-chemistry tools into students hands. 
A related  project is devoted to helping teachers, students, and hobbyists build GAMESS from source code. 

## Todo

- [ ] Add directions, background information, and rationale to README.md
- [ ] Add directions for setting up Cloud9
- [ ] Add directions for installing Vagrant + Virtualbox and basic usage
- [ ] Fill out acknowledments and inspirations
- [ ] Folder or JSON to record people's experiences with using it
- [ ] Script to help users document their feedback
- [ ] Script to install VNC on Cloud9 to enable testing of Jmol

## Acknowledments
