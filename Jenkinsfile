pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t build-img dockerfiles/tetris-build/'
                sh 'docker build -t test-img dockerfiles/tetris-test/'

            }
        }
        stage('Test') {    
            steps {
                echo 'Testing..'
                sh 'dockerfiles/docker-compose up Tester'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'dockerfiles/docker-compose up Builder'
            }
        }
    }
}