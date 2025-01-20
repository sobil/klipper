#!/bin/bash
# # Scripts for installing the dependencied neeped to build klipper for the esp32

# # Stop script early on any error; check variables; be verbose
set -eu


MAIN_DIR=${PWD}
BUILD_DIR=${PWD}/thirdparty
CACHE_DIR=${PWD}/tmp
mkdir -p ${BUILD_DIR} ${CACHE_DIR}
FORCE_INSTALL=false
for arg in "$@"; do
    if [ "$arg" == "--force-install" ]; then
        FORCE_INSTALL=true
        echo "Force install enabled"
        break
    fi
done

######################################################################
# install esp-idf toolchain
######################################################################

RELEASE_BASE_URL="https://github.com/espressif/crosstool-NG/releases/download"
ESP_IDF_VERSION="14.2.0_20241119"
BUILD_ENV_ARCH=$(uname -m | sed 's/arm64/aarch64/g')
OS=$(uname -s | sed 's/Darwin/apple-darwin/g' | sed 's/Linux/linux-gnu/g')
URL="${RELEASE_BASE_URL}/esp-${ESP_IDF_VERSION}/xtensa-esp-elf-${ESP_IDF_VERSION}-${BUILD_ENV_ARCH}-${OS}.tar.xz"
if [[ ! -f ${CACHE_DIR}/xtensa-esp-elf-${ESP_IDF_VERSION}-${BUILD_ENV_ARCH}-${OS}.tar.xz ]] || [[ ${FORCE_INSTALL} = true ]]; then
    echo "Downloading ESP-IDF toolchain from ${URL}"
    curl -L ${URL} -o ${CACHE_DIR}/xtensa-esp-elf-${ESP_IDF_VERSION}-${BUILD_ENV_ARCH}-${OS}.tar.xz
    cd ${BUILD_DIR}
    tar xf ${CACHE_DIR}/xtensa-esp-elf-${ESP_IDF_VERSION}-${BUILD_ENV_ARCH}-${OS}.tar.xz
fi

# ######################################################################
# # esp-idf 
# ######################################################################


sudo apt-get install -y cmake libusb-1.0-0 python3.10-venv build-essential gcc g++
if [ -x "$(command -v cmake)" ]; then
    echo "CMake is already installed"
else
    echo "Installing CMake"
fi


if [ -f ~/esp/esp-idf/idf.py ]; then
    echo "esp-idf.py installed in ~/esp/esp-idf"
else
    mkdir -p ~/esp
    cd ~/esp
    git clone -b v5.4 --recursive https://github.com/espressif/esp-idf.git || true
    ~/esp/esp-idf/install.sh esp32
fi






#Pull down the source

# ESP_IDF_VERSION="5.4"
# URL="https://github.com/espressif/esp-idf/archive/refs/tags/v${ESP_IDF_VERSION}.tar.gz"
# if [[ ! -f ${CACHE_DIR}/esp-idf-v5.4.tar.gz ]] || [[ ${FORCE_INSTALL} = true ]]; then
#     echo "Downloading ESP-IDF from ${URL}"
#     curl -L ${URL} -o ${CACHE_DIR}/esp-idf-v${ESP_IDF_VERSION}.tar.gz
#     tar xf ${CACHE_DIR}/esp-idf-v${ESP_IDF_VERSION}.tar.gz
#     ./esp-idf-v${ESP_IDF_VERSION}/install.sh
# fi




