# Use the official Maven image to build the application
FROM maven:3.8.7-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the entire project into the container
COPY . .

# Build the Maven project (this will compile the Java code and package it into a .jar file)
RUN mvn clean package -DskipTests

# Second stage: Create a minimal runtime environment
FROM openjdk:17-alpine

# Set the working directory for the runtime container
WORKDIR /app

# Copy the generated jar file from the Maven build stage
COPY --from=build /app/target/*.jar /app/HelloWorld.jar

# Run the application
CMD ["java", "-jar", "HelloWorld.jar"]
