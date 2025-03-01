#!/bin/bash

DEST_DIR="data"
ZIP_FILE="$DEST_DIR/large-scale-vehicular-fog-computing-dataset.zip"

# Ensure the data folder exists
mkdir -p "$DEST_DIR"

echo "Looking for dataset..."
# Download dataset if it does not exist
if [ ! -d "$DEST_DIR" ] || [ -z "$(ls -A $DEST_DIR)" ]; then
    echo "Dataset not found. Downloading..."

    curl -L -o "$ZIP_FILE"\
    https://www.kaggle.com/api/v1/datasets/download/majdmustafa/large-scale-vehicular-fog-computing-dataset

    # Unzip the dataset
    unzip -o "$ZIP_FILE" -d "$DEST_DIR"
    rm "$ZIP_FILE"
    echo "Dataset downloaded and extracted to $DEST_DIR."
else
    echo "Dataset already exists at $DEST_DIR."
fi
