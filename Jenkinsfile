pipeline {
    agent { dockerfile true }

    stages {
        stage('Prepare') {
            steps {
                echo 'Removing any previous report...'
                sh 'rm -f build/*.xml'
            }
        }
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
                    sh './bin/unit_tests --gtest_output=xml'
                }
            }
        }
    }
    post {
        success {
            step(xunit(
                thresholds: [ skipped(failureThreshold: '0'), failed(failureThreshold: '0') ],
                tools: [ GoogleTest(pattern: 'build/*.xml') ])
            )
        }
    }
}