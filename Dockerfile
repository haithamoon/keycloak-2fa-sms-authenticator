# Use the official maven image as the base image
FROM maven:3.8.2-openjdk-17 as build

# Set the working directory in the docker
WORKDIR /usr/src/app

# Copy the pom.xml and source code to the working directory
COPY pom.xml .
COPY src/ ./src/

# Build the project and package the source code to a JAR file
RUN mvn -f pom.xml clean package

# Optional: use another stage to store the built JAR if you don't need the Maven build tools in your final image
FROM openjdk:11-jre-slim as runtime

# Set the working directory
WORKDIR /app

# Copy the JAR file built in the "build" stage
COPY --from=build /usr/src/app/target/*.jar /app/

# Print the list of files in /app, showing the JAR file
CMD ["ls", "/app"]

# Second Stage - Copy the JAR to an intermediate Ubuntu container
FROM ubuntu:latest as intermediate
WORKDIR /app
COPY --from=build /usr/src/app/target/*.jar /app/
