# Base image
# Thanks to https://github.com/amrsa1/Android-Emulator-image

FROM ubuntu:20.04

# Create a non-root user `cometa`
RUN useradd -ms /bin/bash cometa

# set directory for sdk 
WORKDIR /home/cometa/

# Install Node.js, npm, git, and other build dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    build-essential \
    make \
    bash \
    # && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    # && apt-get install -y nodejs \
    && apt-get clean


# RUN git clone https://github.com/cometa-rocks/noVNC.git

WORKDIR /home/cometa/noVNC
COPY . .

# CMD ./utils/novnc_proxy --listen 0.0.0.0:6080
CMD ["./utils/novnc_proxy", "--listen", "80"]

# build image for arm and amd processors 
# docker buildx build --platform linux/amd64,linux/arm64 -t cometa/novnc:latest --push .