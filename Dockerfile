# Use a node base image build
FROM node:12

# Set the maintainer - this is optional
LABEL maintainer "oniodunayo@hotmail.com"

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://127.0.0.1:8080 || exit 1

# The port to expose on docker
EXPOSE 8000

# Create app directory
WORKDIR /usr/src/app