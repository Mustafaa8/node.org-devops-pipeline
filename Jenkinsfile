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
                export PATH=$HOME/.nvm/versions/node/v18.16.1/bin:$PATH && node -v && npm -v
                npm ci
                npm test
                '''
            }
        }

    }
}