#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: compressvideo <input_file> [-o <output_file>]"
  exit 1
fi

# Default values
input_file="$1"
output_file="${input_file}_compressed.mp4" # Default output file name

# Parse optional arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  -o | --output)
    output_file="$2"
    shift 2
    ;;
  *)
    shift
    ;;
  esac
done

# Check if input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' does not exist."
  exit 1
fi

# Run ffmpeg compression
ffmpeg -i "$input_file" -c:v libx264 -c:a aac "$output_file" -crf 18 -preset veryslow

# Check if compression was successful
if [ $? -eq 0 ]; then
  echo "Video successfully compressed to '$output_file'"
else
  echo "Error: Compression failed."
  exit 1
fi
