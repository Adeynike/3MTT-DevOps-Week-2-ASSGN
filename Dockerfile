# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./ 

# Install the dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Expose the new port (e.g., 8081 instead of 8080)
EXPOSE 8081

# Define the command to run your app on port 8081
CMD ["npx", "http-server", ".", "-p", "8081"]
