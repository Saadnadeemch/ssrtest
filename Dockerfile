# Stage 1: Build the Angular app
FROM node:18-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build:ssr

# Stage 2: Serve the app with Express
FROM node:18-alpine AS production-stage
WORKDIR /app

# Copy the server and browser folders from the build stage
COPY --from=build-stage /app/dist/animoviback/server ./server
COPY --from=build-stage /app/dist/animoviback/browser ./browser
COPY --from=build-stage /app/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Serve the app using the npm script provided by Angular Universal
CMD ["npm", "run", "serve:ssr"]
