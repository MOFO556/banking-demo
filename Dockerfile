# Flutter web demo
FROM debian:bookworm-slim AS build

ENV DEBIAN_FRONTEND=noninteractive
ENV TAR_OPTIONS=--no-same-owner

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    && rm -rf /var/lib/apt/lists/* \
    && printf '#!/bin/sh\nexec /usr/bin/tar --no-same-owner "$@"\n' \
         > /usr/local/bin/tar \
    && chmod +x /usr/local/bin/tar

ARG FLUTTER_VERSION=3.47.7
RUN curl -fsSL \
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
      -o /tmp/flutter.tar.xz \
    && tar -xJf /tmp/flutter.tar.xz -C /opt \
    && rm /tmp/flutter.tar.xz

ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"
ENV PUB_CACHE=/root/.pub-cache
RUN git config --global --add safe.directory /opt/flutter \
    && flutter config --no-analytics \
    && flutter --version

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .
RUN flutter build web --release --no-web-resources-cdn

FROM nginx:alpine

COPY docker/nginx.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /app/build/web /usr/share/nginx/html
