# Step 1: Build Stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies first for better caching
COPY package*.json ./
RUN npm install

# Copy source and build
COPY . .
RUN npm run build

# Step 2: Production Stage
FROM node:20-alpine

WORKDIR /app

# Copy only production dependencies and built files
COPY --from=builder /app/package*.json ./
RUN npm install --only=production

COPY --from=builder /app/dist ./dist

# Standard NestJS port
EXPOSE 3000

# Start the gateway
CMD ["node", "dist/main"]