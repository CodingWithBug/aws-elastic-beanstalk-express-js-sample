# Simple production-ready image for the sample Express app
FROM node:16-alpine
WORKDIR /app

# Install deps with clean, reproducible lockfile if present
COPY package*.json ./
RUN npm ci --only=production || npm install --production

# Copy source
COPY . .
EXPOSE 8080
# Replace with the real start script if different
CMD ["npm","start"]

