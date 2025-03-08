FROM node:latest AS builder
WORKDIR /app
COPY . .
RUN npm ci && npm run builder

FROM node:latest AS runner
WORKDIR /artifact
