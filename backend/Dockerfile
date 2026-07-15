FROM node:16-alpine

WORKDIR /app

# Install dev dependencies for nodemon
RUN npm install -g nodemon

# Copy package files and install ALL dependencies
COPY package*.json ./
RUN npm ci

# Copy source code
COPY . .

EXPOSE 3001

# Start with nodemon for hot reload
CMD ["nodemon", "server.js"]