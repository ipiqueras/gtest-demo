pipeline {
    agent { dockerfile true }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'mkdir -p build'
                dir ("build") {
                    sh 'cmake ..'
                    sh 'make all'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                dir ("build") {
                    sh './bin/unit_tests'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}