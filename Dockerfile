# 1. Use an official OpenJDK runtime as a parent image
FROM openjdk:17-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the helloworld.java file into the container at /app
COPY . .

# 4. Compile the helloworld.java file
RUN javac src/main/java/com/example/helloworld.java

# 5. Run the helloworld class
CMD ["java", "-cp", "src/main/java", "com.example.helloworld"]
