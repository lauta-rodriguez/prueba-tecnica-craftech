# Stage 1: Build the React app
FROM node:17-alpine AS build

# Set working directory
WORKDIR /app

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install app dependencies
COPY package.json ./
RUN npm install
RUN npm install react-scripts@5.0.1 -g

# Add app and build
COPY . ./
RUN npm run build

# Stage 2: Run the optimized build with serve
FROM node:17-alpine

# Set working directory
WORKDIR /app

# Install serve to serve the build directory
RUN npm install -g serve

# Copy the build output from the first stage
COPY --from=build /app/build ./build

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["serve", "-s", "build", "-l", "3000"]
