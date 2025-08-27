# Base paths
SOURCE_BASE="User_path/U_files/0.36_T/U_files"
DEST_BASE="User_path"

# Loop from 1 to 50
for i in {451..494}; do
  # Construct source and destination paths
  SRC="$SOURCE_BASE/$i/U"
  DEST_DIR="$DEST_BASE/$i/0"

 
  # Copy the file 
    cp "$SRC" "$DEST_DIR/"
    echo "Copied: $SRC -> $DEST_DIR/"
done
