FROM ubuntu:16.04
MAINTAINER My Humble Self <rksdel8895@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install wget git bzip2 && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y libgl1-mesa-glx apt-utils openssh-server net-tools
# Conda update and creation of environment
RUN conda update conda && \
    conda env create -f environment.yml && \
    # Activation of environment and correction of bash
    echo "source activate xlshp_env" > ~/.bash

ADD . /src/jupyterhub
WORKDIR /src/jupyterhub
RUN pip install numpy && \
    pip install jupyter bqplot pyyaml && \
    pip install dockerspawner && \
    

RUN pip install jupyterhub 





CMD jupyterhub
