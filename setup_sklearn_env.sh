#!/bin/bash

# Step 1: Ensure Conda is installed in the workspace
if ! command -v conda &> /dev/null; then
    echo "Conda is not installed. Please install Conda before running this script."
    exit 1
fi

# Step 2: Source Conda's activation script
echo "Sourcing Conda activation script..."
source /opt/conda/bin/activate

# Step 3: Create the Conda Environment
CONDA_ENV_PATH="/home/local/data/env/sklearn_env"
echo "Creating Conda environment at $CONDA_ENV_PATH..."
conda create -p $CONDA_ENV_PATH python=3.9 -y

# Step 4: Activate the Conda Environment
echo "Activating the Conda environment..."
source activate $CONDA_ENV_PATH

# Step 5: Install Required Packages
echo "Installing required packages..."
pip install scikit-learn matplotlib seaborn

# Step 6: Run the PyTorch training script located at /home/local/data/train.py
TRAIN_SCRIPT_PATH="/home/local/data/train.py"
if [ -f "$TRAIN_SCRIPT_PATH" ]; then
    echo "Running the PyTorch training script at $TRAIN_SCRIPT_PATH on CPU..."
    python "$TRAIN_SCRIPT_PATH"
else
    echo "Training script not found at $TRAIN_SCRIPT_PATH"
fi

echo "Training completed successfully!"
