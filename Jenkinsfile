pipeline {
    agent any  // Use any available Jenkins agent
    
    stages {
        // Build stage
        stage('Build') {
            steps {
                echo 'Building the project...'
                // Example: Using Maven to build a Java project
                sh 'mvn clean package'
            }
        }

        // Test stage
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Example: Run JUnit tests using Maven
                sh 'mvn test'
            }
        }

        // Code Quality Analysis (Optional)
        stage('Code Quality Analysis') {
            steps {
                echo 'Running SonarQube for code quality analysis...'
                // Example: Run SonarQube scanner
                sh 'mvn sonar:sonar'
            }
        }

        // Deploy stage
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Example: Build and run Docker image
                sh 'docker build -t myapp:latest .'
                sh 'docker run -d -p 8080:8080 myapp:latest'
            }
        }

        // Release stage
        stage('Release') {
            steps {
                echo 'Releasing the application...'
                // Simulated production release
                echo 'Application released to production!'
            }
        }
    }

    // Post actions: Clean up, notifications, etc.
    post {
        always {
            echo 'Pipeline finished'
        }
        success {
            echo 'Pipeline completed successfully'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
