pipeline {
    agent any

    stages {
        stage('Cloning') {
            steps {
                git branch: 'devops' , url: 'https://github.com/Mustafaa8/nodejs.org-devops-pipeline.git'
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