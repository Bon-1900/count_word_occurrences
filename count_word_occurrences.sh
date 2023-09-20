#!/bin/sh

input_path=""

# Function to display usage information
show_help() {
    echo "Usage: [OPTIONS]"
    echo "Options:"
    echo "  -h, --help       : See documentation."
    echo "  -p, --path PATH  : Specify a path."
    return 1
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            return 0
            ;;
        -p|--path)
            if [[ -n "$2" ]]; then
                input_path="$2"
                shift
            else
                echo "Error: -p or --path flag requires a path argument."
                return 1
            fi
            ;;
        *)
            echo "Error: Unknown option '$1'"
            show_help
            return 1
            ;;
    esac
    shift
done

# Check if an input argument is provided
if [ -z "$input_path" ]; then
  echo "Enter the absolute path of the word document:"
  read userInput
  input_path=$userInput
fi

# Run the Python script with the provided input
module_path=$(dirname "$(which "$0")")
python $module_path/count_word_occurrences.py "$input_path"
