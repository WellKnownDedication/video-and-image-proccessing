#! /usr/bin/bash

VENV_DIR="pvenv"
REQUIREMENTS="requirements.txt"

#Download dataset
source scripts/data_download.sh

if [ -d $VENV_DIR ] && [ -f "$VENV_DIR/bin/activate" ]
then
    echo "Venv already exists."
else
    echo "Venv not found! Creating..."
    #Create venv
    python3 -m venv $VENV_DIR
fi

#Activate and update venv
source $VENV_DIR/bin/activate
pip install --upgrade pip

#Download needed libraries from the list
if [ -f "requirements.txt" ]
then
    pip install -r requirements.txt
else    
    echo "No requirements.txt found"
    exit 1
fi

