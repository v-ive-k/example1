# Use Maven to build and run the application
FROM maven:3.9.9-eclipse-temurin-17

# Set the working directory
WORKDIR /app

# Copy the application code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Run the generated JAR file (assuming it's located in the target directory)
CMD ["java", "-cp", "target/classes", "sample.HelloWorld"]
