FROM rust:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgtk-3-dev \
    libssl-dev \
    pkg-config \
    libdbus-1-dev \
    libasound2-dev \
    libpulse-dev \
    libudev-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN cargo build --release --package psst-gui --package psst-cli

ENTRYPOINT []
# default = cli, can override at runtime
CMD ["./target/release/psst-cli"]  
