#!/usr/bin/env bash
set -ex

# Update config.sub and config.guess to support arm64-apple-darwin
# The source tarball has 2015 versions which predate Apple Silicon
autoreconf -vfi
./configure \
  --prefix="${PREFIX}" \
  --with-libpng="${PREFIX}"

make -j ${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
