# Dockerfile for AutoGraph Strapi CMS
# Optimized for Railway deployment

# Build stage
FROM node:20-alpine AS builder

# Install build dependencies
RUN apk add --no-cache libc6-compat python3 make g++

WORKDIR /app

# Copy package files and lockfiles
COPY package*.json ./
COPY backend/package*.json backend/package-lock.json ./backend/

# Install dependencies
RUN npm ci

# Copy backend source
COPY backend ./backend


# Production stage
FROM node:20-alpine AS runner

# Install production dependencies
RUN apk add --no-cache libc6-compat

WORKDIR /app

# Copy package files and lockfiles
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/backend/package*.json ./backend/

# Install production dependencies only
RUN npm ci --workspace=backend --omit=dev

# Copy source files (build will happen on first start if needed)
COPY --from=builder /app/backend ./backend

# Create uploads and database directories
RUN mkdir -p /app/backend/public/uploads && \
    mkdir -p /app/backend/.tmp && \
    chmod 777 /app/backend/.tmp

# Stay in root directory (workspace root)
WORKDIR /app

# Expose Strapi port
EXPOSE 1337

# Set Node environment
ENV NODE_ENV=production

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
  CMD node -e "require('http').get('http://localhost:1337/_health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Start Strapi using workspace command
CMD ["npm", "start"]
