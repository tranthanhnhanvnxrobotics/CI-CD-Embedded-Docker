# Dùng Ubuntu làm nền
FROM ubuntu:22.04

# Tránh bị hỏi Yes/No khi cài đặt
ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt bộ vũ khí biên dịch ARM và CMake
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    && rm -rf /var/lib/apt/lists/*

# Chuyển vào thư mục làm việc
WORKDIR /workspace
