# Build Stage
FROM node:lts-alpine AS build
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the course source code
COPY . .

# Build the Astro site
# Note: We override the outDir to stay within the app directory for the Docker build
RUN npx astro build --outDir ./dist

# Production Stage
FROM nginx:stable-alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Create the directory for the course
RUN mkdir -p /usr/share/nginx/html/courses/adversary-hunting

# Copy built assets from the build stage to the subdirectory
COPY --from=build /app/dist /usr/share/nginx/html/courses/adversary-hunting

# Add a redirect from the root to the course path
RUN echo '<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0; url=/courses/adversary-hunting/"></head><body></body></html>' > /usr/share/nginx/html/index.html

# Copy built assets to root too just in case they want both, 
# but the links will use /courses/adversary-hunting/
# Actually, better to just use the subdirectory to be consistent with the links.

CMD ["nginx", "-g", "daemon off;"]
