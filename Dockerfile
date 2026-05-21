# ──────────────────────────────────────────────────────────────────────────────
# Stage 1: Build all lecture slides
# ──────────────────────────────────────────────────────────────────────────────
FROM node:22-slim AS builder

# Install chromium for Slidev's headless build (needed for PDF export, optional
# for static HTML build — keeping it for completeness; can remove to cut size)
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 1. Install dependencies (cache layer)
COPY package.json package-lock.json* ./
RUN npm ci

# 2. Copy all lecture content + scripts
COPY scripts/ scripts/
COPY luento1/ luento1/
COPY luento2/ luento2/
COPY luento3/ luento3/

# 3. Build every lecture
RUN node scripts/build-all.mjs

# ──────────────────────────────────────────────────────────────────────────────
# Stage 2: Poll server deps (separate to cache independently)
# ──────────────────────────────────────────────────────────────────────────────
FROM node:22-slim AS poll-deps

WORKDIR /poll-server
COPY poll-server/package.json poll-server/package-lock.json ./
RUN npm ci --production

# ──────────────────────────────────────────────────────────────────────────────
# Stage 3: Runtime — nginx + node poll server + supervisord
# ──────────────────────────────────────────────────────────────────────────────
FROM node:22-slim AS runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx supervisor \
    && rm -rf /var/lib/apt/lists/*

# ── nginx static files ──────────────────────────────────────────────────────
COPY --from=builder /app/dist /var/www/slides
# Copy vote.html from the addon (included via poll-server directory)
COPY poll-server/vote.html /var/www/slides/vote.html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# Remove the default site
RUN rm -f /etc/nginx/sites-enabled/default

# ── Poll server ─────────────────────────────────────────────────────────────
WORKDIR /poll-server
COPY poll-server/ ./
COPY --from=poll-deps /poll-server/node_modules ./node_modules

# ── supervisord ─────────────────────────────────────────────────────────────
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# nginx listens on 80 (host nginx proxies to this); poll WS on 3032 (internal)
EXPOSE 80 3032

ENV NODE_ENV=production \
    POLL_SERVER_PORT=3032 \
    PRESENTER_TOKEN=changeme

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
