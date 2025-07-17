#!/bin/bash

# Loop through numbers 1 to 9
for i in {1..9}; do
  # Define old and new filenames
  old="test_${i}.csv"
  new=$(printf "test_%02d.csv" "$i")

  # Check if the old file exists
  if [ -e "$old" ]; then
    mv "$old" "$new"
    echo "Renamed $old to $new"
  else
    echo "File $old does not exist."
  fi
done
