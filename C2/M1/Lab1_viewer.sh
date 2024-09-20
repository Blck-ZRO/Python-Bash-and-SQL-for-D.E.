for FILE in "$@"; do
  echo "Processing file: $FILE"

  #Check if any arguments have been defined
  if [ "$#" -eq 0 ]; then
    echo "No arguments entered. Please, select a file!"
    exit 1

  # Check if file exists
  elif [ ! -f "$FILE" ]; then
    echo "Error: File not found"
    exit 1
  fi

  #Print file size
  echo -n "File size: "
  wc -c < "$FILE"

  #date and time of last modification
  echo -n "Last Modification: "
  date -d @"$(stat --format="%Y" $FILE)"

  # Output file contents
  echo "Contents of $FILE:"
  cat "$FILE"

  # Show file info
  echo -e "\nFile info:"
  ls -l "$FILE"
  
done
