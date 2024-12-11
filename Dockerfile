# Use a smaller base image
FROM node:alpine AS build

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .
 

# Use a smaller base image for the runtime
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /app /app

# Expose port and run the app
EXPOSE 3000
CMD ["npm", "start"]
