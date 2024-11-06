# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies and http-server globally
RUN npm install && npm install -g http-server

# Copy the rest of the application files to the working directory
COPY . .

# Expose the port your app will run on
EXPOSE 8081

# Define the command to run your app
CMD ["http-server", ".", "-p", "8081"]
