# Puppeteer's official docker image
FROM ghcr.io/puppeteer/puppeteer:23.6.0

# Root permissions required
USER root

# Required to prevent errors
RUN service dbus start

# Set working directory in the container
WORKDIR /home/pptruser

# Copy application to working directory
COPY . .

# Install npm dependencies
RUN npm install

# Ensure run.sh is executable
RUN chmod +x run.sh

# Ensure files are owned by puppeteer user
RUN chown -R pptruser .

# Using puppeteer user for security, and it is setup to use puppeteer.
USER pptruser

# Run the application with run.sh
ENTRYPOINT ["./run.sh"]
