# Use the official Nginx image as a base image
FROM nginx:alpine

# Copy the static HTML files into the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80