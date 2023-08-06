#!/bin/sh

# Check if an input argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input>"
  exit 1
fi

# Store the input in a variable
input_data=$1

# Run the Python script with the provided input
python count_word_occurrences.py "$input_data"
