# Step 1: Build Stage (Builder)
FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency files first to leverage Docker cache
COPY package*.json ./
RUN npm install

# Copy source code and build the NestJS app
COPY . .
RUN npm run build

# Step 2: Runtime Stage
FROM node:20-alpine

# Set to production for better performance
ENV NODE_ENV=production

WORKDIR /app

# Install only production dependencies
COPY package*.json ./
RUN npm install --only=production && npm cache clean --force

# Copy built assets from the builder stage
COPY --from=builder /app/dist ./dist

# Security: Run as a non-root user (important for Docker security)
USER node

# Port 3000 is internal; you mapped it to 3001 in your docker-compose
EXPOSE 3000

# Start the service
CMD ["node", "dist/main"]