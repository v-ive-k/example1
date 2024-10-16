# Use the official Maven image to build the application
FROM maven:3.9.4-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application (skip tests)
RUN mvn clean package -DskipTests

# Use a smaller image to run the application
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/myproject-1.0-SNAPSHOT.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
