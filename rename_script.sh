#!/bin/bash

# Loop through all .mkv files in the current directory
for file in *.mkv; do
    # Extract the title metadata using ffmpeg
    title=$(ffmpeg -i "$file" -f ffmetadata - 2>&1 | grep -m 1 'title=' | sed 's/title=//')

    if [ -n "$title" ]; then
        # Clean up the title to make it safe for filenames (replace spaces and special characters)
        clean_title=$(echo "$title" | sed 's/[^a-zA-Z0-9]/_/g')

        # Construct the new filename
        new_file="${clean_title}.mkv"

        # Rename the file
        mv "$file" "$new_file"
        echo "Renamed '$file' to '$new_file'"
    else
        echo "No title metadata found for '$file'"
    fi
done
