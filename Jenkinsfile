pipeline {
    agent { dockerfile true }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                pwd
                mkdir build
                dir build (
                    pwd
                    sh 'cmake ..'
                    sh 'make all'
                )
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                dir build (
                    if (fileExists('./bin/unit_tests')) {
                        sh './bin/unit_tests'
                    } else {
                        error 'Could not create unit_tests executable'
                    }
                )
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}