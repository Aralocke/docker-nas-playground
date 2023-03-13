#!/bin/bash

STORAGE_DIR="tmp"
MINIO_STORAGE="${STORAGE_DIR}/minio"
BIN_DIR="${STORAGE_DIR}/bin"

if [ ! -d "${MINIO_STORAGE}" ]; then
    mkdir -p ${MINIO_STORAGE}
fi
if [ ! -d "${BIN_DIR}" ]; then
    mkdir -p ${BIN_DIR}
fi

MC_EXE=""
_TYPE="$(uname -s)"

case "${_TYPE}" in
    Linux* | CYGWIN*)
        if [ ! -f "${BIN_DIR}/mc" ]; then
            curl -q https://dl.min.io/client/mc/release/linux-amd64/mc \
                -o ${BIN_DIR}/mc
            chmod +x ${BIN_DIR}/mc
        fi
        MC_EXE="${BIN_DIR}/mc"
    ;;
    MINGW*)
        if [ ! -f "${BIN_DIR}/mc.exe" ]; then
            curl -q https://dl.min.io/client/mc/release/windows-amd64/mc.exe \
                -o ${BIN_DIR}/mc.exe
        fi
        MC_EXE="${BIN_DIR}/mc.exe"
    ;;
    *)
        echo "Unsupported OS: '${_TYPE}'"
        exit 2
esac

if [ ! -f "${MC_EXE}" ]; then
    echo "Failed to find minio-client: '${MC_EXE}'"
    exit 1
fi

${MC_EXE} --config-dir ./tmp/minio --no-color ${@}
