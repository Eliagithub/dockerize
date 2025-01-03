# Use a lightweight node image
FROM node:alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json . 


# Install dependencies (this step uses the cached image if no changes to package.json)
RUN npm install

# Copy the rest of the app's source code into the container
COPY . .

# Expose the port that the app will run on
EXPOSE 3000

# Start the app using npm (ensure the start script exists in package.json)
CMD ["npm", "start"]
