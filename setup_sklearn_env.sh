#!/bin/bash

# Step 1: Ensure Conda is installed in the workspace
if ! command -v conda &> /dev/null; then
    echo "Conda is not installed. Please install Conda before running this script."
    exit 1
fi

# Step 2: Source Conda's activation script
echo "Sourcing Conda activation script..."
source /opt/conda/bin/activate

# Step 3: Activate the existing Conda Environment
CONDA_ENV_PATH="/home/local/data/env/sklearn_env"
echo "Activating the Conda environment at $CONDA_ENV_PATH..."
source activate $CONDA_ENV_PATH

# Uncomment the following lines to install additional Python packages in the environment
# echo "Installing additional packages..."
# pip install <package_name_1>
# pip install <package_name_2>
# For example, to install pandas and numpy, uncomment the following lines:
# pip install pandas
# pip install numpy

# Step 4: Run the training script located at /home/local/data/train.py
TRAIN_SCRIPT_PATH="/home/local/data/train.py"
if [ -f "$TRAIN_SCRIPT_PATH" ]; then
    echo "Running the training script at $TRAIN_SCRIPT_PATH on CPU..."
    python "$TRAIN_SCRIPT_PATH"
else
    echo "Training script not found at $TRAIN_SCRIPT_PATH"
fi

echo "Training completed successfully!"

# Keep the script running indefinitely
tail -f /dev/null
