# Step 1: Build Stage (Builder)
FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies first (better for Docker layer caching)
COPY package*.json ./
RUN npm install

# Copy source and build the application
COPY . .
RUN npm run build

# Step 2: Runtime Stage
FROM node:20-alpine

# Set environment to production
ENV NODE_ENV=production

WORKDIR /app

# Only install production dependencies to keep the image small
COPY package*.json ./
RUN npm install --only=production && npm cache clean --force

# Copy only the necessary build artifacts
COPY --from=builder /app/dist ./dist

# Non-root user for security
USER node

# Internal port (mapped in your docker-compose)
EXPOSE 3000

# Start the service
CMD ["node", "dist/main"]