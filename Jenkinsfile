pipeline {
    agent any

    stages {
        stage('Cloning') {
            steps {
                git branch: 'main' , url: 'https://github.com/Mustafaa8/nodejs.org-devops-pipeline' , credentialsId: 'gittoken'
            }
        }
        stage('Building') {
            steps {
                echo "Building and Pipeline is working"
            }
        }
    }
}