pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'docker build -t dep-img dockerfiles/tetris-dep/'
                sh 'docker build -t build-img dockerfiles/tetris-build/'
                sh 'docker build -t test-img dockerfiles/tetris-test/'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh """
                    docker-compose -f dockerfiles/docker-compose.yml up Tester
                """
            }
        }
        stage('Publish')
        {
            steps {
                echo 'Publishing...'
                sh """ 
                    mkdir ./APP

                    docker-compose -f dockerfiles/docker-compose.yml up Builder
                    CID=`docker run --rm --pull=missing --name temp -dit -v build:/build busybox sh`
                    echo \$CID
                    docker cp \$CID:/build/build_${VERSION} ./APP

                """ 
            }
        }
        stage('Deploy')
        {
            steps
            {
                sh """
                    docker-compose -f dockerfiles/docker-compose.yml up -d Deploy
                """
            }

        }

    }
    post
    {
        success
        {
            archiveArtifacts artifacts: "APP/build_${VERSION}"
        }
        cleanup
        {
            sh """
                rm ./APP -rf
                docker stop temp
            """
        }

    }
}
