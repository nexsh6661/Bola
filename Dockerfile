# Use an official lightweight Linux image
FROM ubuntu:22.04

# Update packages and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    python3 \
    python3-pip \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download yt-dlp
RUN wget -O /usr/local/bin/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux \
    && chmod +x /usr/local/bin/yt-dlp

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the default entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
