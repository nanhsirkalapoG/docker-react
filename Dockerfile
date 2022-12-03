## builder phase
# Base image
FROM node:14-alpine as builder

# Prepare the environment
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

## Run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Start command - Default command to start nginx