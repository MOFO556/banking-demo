# Flutter web demo
FROM debian:bookworm-slim AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    && rm -rf /var/lib/apt/lists/*

ARG FLUTTER_VERSION=3.47.7
RUN git clone --depth 1 --branch "${FLUTTER_VERSION}" \
    https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
ENV PUB_CACHE=/root/.pub-cache

RUN git config --global --add safe.directory /flutter \
    && flutter config --no-analytics \
    && flutter precache --web

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .
RUN flutter build web --release --no-web-resources-cdn

FROM nginx:alpine

COPY docker/nginx.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /app/build/web /usr/share/nginx/html
