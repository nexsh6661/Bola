#!/bin/bash
set -e

# Check for required arguments
if [ -z "$1" ]; then
  echo "Usage: entrypoint.sh <video_url>"
  exit 1
fi

VIDEO_URL="$1"
OUTPUT_FILE="/output/bola.mp4"

# Run yt-dlp with the specified format and output location
yt-dlp -f "best" "$VIDEO_URL" -o "$OUTPUT_FILE"

echo "Download complete: $OUTPUT_FILE"
