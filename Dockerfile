# Use the official OpenJDK image as a base
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the HelloWorld.java file into the container
COPY . .

# Compile the HelloWorld.java file
RUN javac HelloWorld.java

# Run the HelloWorld class
CMD ["java", "HelloWorld"]
