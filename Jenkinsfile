pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Example build command for a Maven project
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                // Example test command using JUnit
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                // Example deploy command for Docker
                sh 'docker build -t myapp .'
                sh 'docker run -d -p 8080:8080 myapp'
            }
        }
    }
}
