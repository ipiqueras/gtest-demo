pipeline {
    agent { dockerfile true }

    stages {
        stage('Build') {
            steps {
                echo 'Building.. in $PWD'
                mkdir build
                dir build (
                    echo 'Building.. in $PWD'
                    cmake ..
                    make all
                )
            }
        }
        stage('Test') {
            steps {
                echo 'Testing.. in $PWD'
                dir build (
                    if (fileExists('./bin/unit_tests')) {
                        ./bin/unit_tests
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