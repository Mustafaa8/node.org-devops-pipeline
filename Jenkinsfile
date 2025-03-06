pipeline {
    agent any

    stages {
        stage('Cloning') {
            steps {
                git branch: 'devops' , url: 'git@github.com:Mustafaa8/nodejs.org-devops-pipeline.git' , credentialsId: 'gittoken'
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