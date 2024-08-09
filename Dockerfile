FROM nvcr.io/nvidia/pytorch:24.01-py3
# Install CONDA for ease of package installation
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda.sh && \
  bash /opt/miniconda.sh -b -p /opt/conda
# Add conda to the base path
ENV PATH /opt/conda/bin:$PATH
# Run the CONDA init bash command to install required .bashrc
RUN conda init bash
