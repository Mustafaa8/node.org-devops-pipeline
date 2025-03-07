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
        stage('Unit Testing') {
            steps {
                sh '''
                npm ci
                npm test
                '''
            }
        }

    }
}