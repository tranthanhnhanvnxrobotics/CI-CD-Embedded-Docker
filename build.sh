#!/bin/bash
# Dọn dẹp thư mục build cũ (nếu có)
rm -rf build
mkdir build
cd build

# Chạy CMake (Lệnh tối thượng của bạn)
cmake -DCMAKE_SYSTEM_NAME=Generic \
      -DCMAKE_C_COMPILER=arm-none-eabi-gcc \
      -DCMAKE_CXX_COMPILER=arm-none-eabi-g++ \
      -DCMAKE_ASM_COMPILER=arm-none-eabi-gcc \
      -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
      -DCMAKE_C_FLAGS="-mcpu=cortex-m4 -mthumb" \
      -DCMAKE_CXX_FLAGS="-mcpu=cortex-m4 -mthumb" \
      -DCMAKE_ASM_FLAGS="-mcpu=cortex-m4 -mthumb" \
      -DCMAKE_EXE_LINKER_FLAGS="-T../STM32F407VGTX_FLASH.ld --specs=nosys.specs" ..

# Biên dịch
make
