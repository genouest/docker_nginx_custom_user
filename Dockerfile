FROM nginx:1.30.5 AS fancyindex-builder

ARG FANCYINDEX_VERSION=0.6.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential ca-certificates curl \
        libpcre2-dev zlib1g-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN curl -fsSL "https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" | tar xz \
    && curl -fsSL "https://github.com/aperezdc/ngx-fancyindex/archive/refs/tags/v${FANCYINDEX_VERSION}.tar.gz" | tar xz \
    && cd "nginx-${NGINX_VERSION}" \
    && ./configure --with-compat --add-dynamic-module="../ngx-fancyindex-${FANCYINDEX_VERSION}" \
    && make modules

# ---- Final image ----
FROM nginx:1.30.5

COPY --from=fancyindex-builder /tmp/nginx-*/objs/ngx_http_fancyindex_module.so /usr/lib/nginx/modules/

ADD /scripts/ /scripts/
ADD /nginx/nginx.conf.template /
COPY /conf/default.conf /etc/nginx/conf.d/default.conf
ADD entrypoint.sh /


ENV RUN_USER='nginx'
ENV RUN_GROUP='nginx'

ENTRYPOINT ["/entrypoint.sh"]
