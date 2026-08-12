# Use the official NGINX unprivileged Alpine image for security
FROM nginxinc/nginx-unprivileged:alpine

# Copy the HTML file and rename it to index.html so it serves as the root page
COPY mvp_timer.html /usr/share/nginx/html/index.html

# Expose the unprivileged NGINX port
EXPOSE 8080
