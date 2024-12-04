#!/bin/bash

# This script attempts to process a file, but it has a subtle error
# related to how it handles the return status of commands.

file_to_process="my_file.txt"

if [ -f "$file_to_process" ]; then
  echo "File exists"
  # Attempt to process the file. Assume some command that might fail
  process_command "$file_to_process"
  # Check the return status of the command, but with a bug.
  if [ $? -eq 0 ]; then
    echo "File processed successfully"
  else
    echo "Error processing file"
  fi
else
  echo "File does not exist"
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