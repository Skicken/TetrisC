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
                sh 'cd dockerfiles'
                sh 'docker-compose -f dockerfiles/docker-compose.yml up Tester'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'cd dockerfiles'
                sh 'docker-compose -f dockerfiles/docker-compose.yml up Builder'
            }
        }
    }
}