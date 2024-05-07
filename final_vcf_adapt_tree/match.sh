#!/bin/bash

# Read the content of short_rn.txt
while IFS= read -r identifier; do
    # Match the identifier with species_popID in metadata_ID.txt
    matched_line=$(grep "$identifier" metadata_ID.txt)
    # Print the matched line
    echo "$matched_line"
done < short_rn.txt

