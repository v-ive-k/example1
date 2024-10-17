# Use Maven to build and run the application
FROM maven:3.9.9-eclipse-temurin-17

# Set the working directory
WORKDIR /app

# Copy the application code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a smaller JDK image to run the jar
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy the built jar from the previous stage
COPY --from=build /app/target/sample-1.jar .

# Run the application
ENTRYPOINT ["java", "-jar", "target/sample-1.jar"]
