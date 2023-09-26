#!/bin/bash

# Abort script on error
set -e

# Install Anaconda (Ubuntu)
echo "Installing Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda3
export PATH="$HOME/anaconda3/bin:$PATH"

# Update Anaconda
echo "Updating Anaconda..."
conda update -n base -c conda-forge conda

# Verify Anaconda Installation
echo "Verifying Anaconda Installation..."
conda --version
python --version

# Download conda-3-10-env.yaml from URL
echo "Downloading conda-3-10-env.yaml..."
wget https://raw.githubusercontent.com/jasonstrimpel/quant-stack/main/quant-stack-3-10-env.yaml -O quant-stack-3-10-env.yaml

# Create my_quant_lab Virtual Environment
echo "Creating my_quant_lab Virtual Environment..."
conda env create -n quant_lab --file quant-stack-3-10-env.yaml

# Activate my_quant_lab Virtual Environment
echo "Activating my_quant_lab Virtual Environment..."
source activate quant_lab

# Install Additional Stack Packages
echo "Installing Additional Stack Packages..."
pip install pyfolio-reloaded==0.9.5 alphalens-reloaded==0.4.3 quantstats==0.0.62 --no-deps
pip install zipline-reloaded==3.0.3
pip uninstall bottleneck -y

echo "Script execution completed."