ARG BUILDKIT_VERSION=sha256:578d0924c257c4de4ff32061673b62330494ab24ffa732b6a8f6622a7a8c6157
FROM --platform=linux/x86_64 ghcr.io/everest/build-kit-alpine@${BUILDKIT_VERSION}

ARG EVEREST_VERSION=2024.8.0
ENV EVEREST_VERSION=${EVEREST_VERSION}

COPY install.sh ./

# Cloning the repo now and copying files over
RUN git clone https://github.com/EVerest/everest-core.git \
        && cd everest-core \
        && git checkout ${EVEREST_VERSION} \
        && cd .. \
        && mkdir -p /ext/scripts \
        && mv install.sh /ext/scripts/install.sh \
        && mv everest-core /ext/source \
        # Don't run the test-and-install script since it deletes the build directory!
        && /entrypoint.sh run-script install

# Copy over the custom config *after* compilation and installation
COPY config-docker.json ./dist/share/everest/modules/OCPP/config-docker.json
COPY config.json ./dist/share/everest/modules/OCPP201/config.json
COPY device_model_storage_maeve_sp1.db ./dist/share/everest/modules/OCPP201/device_model_storage.db

COPY run-test.sh /ext/source/tests/run-test.sh
COPY test-exit-code.sh /ext/source/tests/test-exit-code.sh

LABEL org.opencontainers.image.source=https://github.com/everest/everest-demo
