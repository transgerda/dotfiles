# Check if arguments are provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <path1> [<path2> ...]"
  exit 1
fi

read -p "Are you sure? Type y to proceed: " confirm

if [ "$confirm" == "y" ]; then
  echo "Deleting..."
  rm -rf "$@"
  echo "Done."
else
  echo "Aborted."
  exit 1
fi

