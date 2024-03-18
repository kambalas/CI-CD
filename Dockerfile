FROM amazoncorretto:21

# Set the working directory
WORKDIR /app

# Copy the Gradle files
COPY build.gradle settings.gradle gradlew gradle /app/

# Use a shell script block to ensure commands are executed in sequence without intermediate layers
RUN chmod +x ./gradlew && \
    ./gradlew --version

# Copy the project files
COPY . /app

# Build the project
RUN ./gradlew build

# Set the startup command
CMD ["java", "-jar", "build/libs/message.jar"]
