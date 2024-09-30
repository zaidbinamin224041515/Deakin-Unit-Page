#!/bin/bash
# Ensure the script exits if any command fails
set -e

# 1. Build Stage
echo "Building the project..."
mvn clean package
if [ $? -eq 0 ]; then
    echo "Build successful!"
else
    echo "Build failed!"
    exit 1
fi

# 2. Test Stage
echo "Running unit tests..."
mvn test
if [ $? -eq 0 ]; then
    echo "Tests passed!"
else
    echo "Tests failed!"
    exit 1
fi

# 3. Code Quality Analysis (optional)
echo "Running code quality analysis with SonarQube..."
mvn sonar:sonar
if [ $? -eq 0 ]; then
    echo "Code quality check passed!"
else
    echo "Code quality check failed!"
    exit 1
fi

# 4. Deploy Stage
echo "Building Docker image..."
docker build -t myapp:latest .
if [ $? -eq 0 ]; then
    echo "Docker image built successfully!"
else
    echo "Docker image build failed!"
    exit 1
fi

echo "Deploying the application..."
docker run -d -p 8080:8080 myapp:latest
if [ $? -eq 0 ]; then
    echo "Application deployed successfully!"
else
    echo "Deployment failed!"
    exit 1
fi

# 5. Release Stage
echo "Releasing the application to production (simulated)..."
# Simulate production release here
echo "Application released to production!"
