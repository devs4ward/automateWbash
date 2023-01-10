#!/bin/bash

# Run the sync command
sync

# Check the exit status of the sync command
if [ $? -eq 0 ]; then
  # Sync command was successful
  echo "drive(s) is ready to be ejected"
else
  # Sync command encountered an error
  echo "Sync command encountered an error"
fi

