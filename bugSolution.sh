#!/bin/bash

# This script is a corrected version of the buggy script.
# It correctly handles the return status of the 'process_command' function.

file_to_process="my_file.txt"

if [ -f "$file_to_process" ]; then
  echo "File exists"
  # Attempt to process the file
  process_command "$file_to_process"
  # Correctly check the return status
  if [ $? -eq 0 ]; then
    echo "File processed successfully"
  else
    echo "Error processing file. Exiting with error code."
    exit 1
  fi
else
  echo "File does not exist"
  exit 1 #Exit with error if the file doesn't exist.
fi

# Placeholder for a command that might fail
function process_command() {
  # Simulate a file processing error, sometimes failing
  if (( RANDOM % 2 == 0 )); then
    echo "Simulating file processing success"
    exit 0 # Success
  else
    echo "Simulating file processing failure"
    exit 1 # Failure
  fi
} 