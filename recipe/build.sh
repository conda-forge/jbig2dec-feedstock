#!/usr/bin/env bash
set -ex

autoreconf -i
./configure \
  --prefix="${PREFIX}" \
  --with-libpng="${PREFIX}"

make -j ${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
