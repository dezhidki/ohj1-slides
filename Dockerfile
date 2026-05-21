# ──────────────────────────────────────────────────────────────────────────────
# Stage 1: Build all lecture slides
# ──────────────────────────────────────────────────────────────────────────────
FROM node:22-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install deps first for better layer caching
COPY package.json package-lock.json* ./
RUN npm ci

# Copy everything (scripts + all luento* folders)
# .dockerignore excludes node_modules, dist, .git, etc.
COPY . .

# 3. Build every lecture found automatically
RUN bash build.sh

# ──────────────────────────────────────────────────────────────────────────────
# Stage 2: Runtime — Caddy + Node poll server
# ──────────────────────────────────────────────────────────────────────────────
FROM caddy:2-alpine AS runtime

# Node is needed to run the poll server
RUN apk add --no-cache nodejs

# Slide SPA bundles
COPY --from=builder /app/dist /var/www/slides

# vote.html lives in the addon's public dir; it's installed as a dependency
COPY --from=builder /app/node_modules/slidev-addon-polls/public/vote.html /var/www/slides/vote.html

# Poll server — reference directly from installed addon; only needs ws
COPY --from=builder /app/node_modules/slidev-addon-polls/poll-server/server.js /poll-server/server.js
COPY --from=builder /app/node_modules/ws /poll-server/node_modules/ws

# Caddy config
COPY Caddyfile /etc/caddy/Caddyfile

# Entrypoint: start poll server in background, then run Caddy in foreground
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

ENV NODE_ENV=production \
    PORT=3032 \
    PRESENTER_TOKEN=changeme

ENTRYPOINT ["/docker-entrypoint.sh"]
