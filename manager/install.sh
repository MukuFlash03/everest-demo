#!/bin/sh

cd /ext/source \
&& mkdir build \
&& cd build \
&& echo "CI/CD Test: Running cmake" \
&& cmake -DBUILD_TESTING=ON ..\
&& echo "CI/CD Test: Running make j6" \
&& make install -j6 \
&& echo "CI/CD Test: Running make install_everest_testing" \
&& make install_everest_testing \
