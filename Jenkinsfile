pipeline {
    agent any
    tools {
        nodejs 'nodejs18'
    }
    stages {
        stage('Cloning') {
            steps {
                git branch: 'devops' , url: 'https://github.com/Mustafaa8/nodejs.org-devops-pipeline.git' , credentialsId: 'gittoken'
            }
        }
        stage('Linting the Code') {
            steps {
                sh '''
                npm ci
                npm run format
                '''
            }
        }
        stage('Unit Testing') {
            steps {
                sh '''
                npm test
                '''
            }
        }
        stage('Codebase Scanning'){
            steps {
                sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v ./:/output aquasec/trivy fs .'
            }
        }

    }
}