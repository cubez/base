FROM alpine:3.3
MAINTAINER cubez <cubez@cubez.nl>

# Variables
ENV PACKAGES    bash curl
ENV S6_VERSION  v1.17.1.1

# Install packages
RUN apk --no-cache add $PACKAGES

# Copy root files
COPY rootfs /

# Install s6-overlay
RUN curl -sSL https://github.com/just-containers/s6-overlay/releases/download/$S6_VERSION/s6-overlay-amd64.tar.gz \
    | tar xvfz - -C /

# Set entrypoint
ENTRYPOINT [ "/init" ]