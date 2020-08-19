ARG NGINX_IMAGE_TAG="1.19.2-alpine"

# --- stage:release ------------------------------------------------------------
FROM nginx:${NGINX_IMAGE_TAG} as release

ARG BUILD_BRANCH
ARG BUILD_HASH

LABEL build.stage="release"
LABEL build.branch="${BUILD_BRANCH}"
LABEL build.hash="${BUILD_HASH}"

RUN set -x \
    && rm -rf /usr/share/nginx/html/*

COPY nginx /etc/nginx
COPY html /usr/share/nginx/html

