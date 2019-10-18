#!/bin/sh

scripts_dir=$(dirname $0)
scripts_dir=$(cd $scripts_dir ; pwd)
conda_eda=$(dirname $scripts_dir)

# docker pull quay.io/pypa/manylinux2010_x86_64
#docker pull quay.io/pypa/manylinux1_x86_64

docker build -t litex-conda-eda .
if test $? -ne 0; then exit 1; fi

docker run -it \
        -v ${conda_eda}:/conda-eda \
        litex-conda-eda
if test $? -ne 0; then exit 1; fi

