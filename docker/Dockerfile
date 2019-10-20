
FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y wget git coreutils autoconf make cmake binutils
RUN mkdir -p /conda
RUN wget -O /conda/Miniconda3-latest-Linux-x86_64.sh -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod a+x /conda/Miniconda3-latest-Linux-x86_64.sh
RUN /conda/Miniconda3-latest-Linux-x86_64.sh -p /conda -b -f

RUN /conda/bin/conda info

RUN /conda/bin/conda config --set safety_checks disabled
RUN /conda/bin/conda config --set channel_priority strict
# mkdir -p ~/.conda/pkg
# conda config --prepend pkgs_dirs ~/.conda/pkg

RUN /conda/bin/conda config --show

# echo "python==3.7" > $CONDA_PATH/conda-meta/pinned
# echo "conda-build==3.14.0" >> $CONDA_PATH/conda-meta/pinned

RUN /conda/bin/conda install -y python
RUN /conda/bin/conda update -y conda

RUN /conda/bin/conda install -y conda-build
RUN /conda/bin/conda install -y conda-verify
RUN /conda/bin/conda install -y ripgrep

RUN /conda/bin/conda install -y anaconda-client
RUN /conda/bin/conda install -y jinja2

RUN /conda/bin/conda update -y --all

# Install user tools
RUN apt-get install -y vim

# Update paths
ENV PATH="/conda/bin:${PATH}"
RUN mkdir -p /build


CMD runuser root

