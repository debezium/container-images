####
# This Dockerfile is used in order to build a container with Debezium platform UI.
###
FROM registry.access.redhat.com/ubi9/nodejs-20 AS builder
WORKDIR /build

# Install package and extract necessary files
RUN npm install -g serve && \
    npm install @debezium/platform-stage@latest && \
    mkdir -p /build/output && \
    cp -r node_modules/@debezium/platform-stage/dist /build/output/ && \
    cp node_modules/@debezium/platform-stage/dist/inject-env.sh /build/output/

# Final image
FROM mirror.gcr.io/library/node:20-alpine
WORKDIR /app

RUN apk add --no-cache wget && \
    npm install -g serve --production && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup -u 1001 && \
    chown -R appuser:appgroup /app

# Copy only necessary files from builder
COPY --from=builder --chown=appuser:appgroup /build/output/dist ./dist
COPY --from=builder --chown=appuser:appgroup /build/output/inject-env.sh ./inject-env.sh
RUN chmod +x /app/inject-env.sh

USER appuser

ENV NODE_ENV=production \
    PORT=3000 \
    PATH="/usr/local/bin:${PATH}"

LABEL maintainer="Debezium Community" \
      description="Debezium Platform Stage UI" \
      org.opencontainers.image.source="https://github.com/debezium/debezium-platform"

EXPOSE 3000
CMD ["./inject-env.sh"]