pipeline {
    agent any

    environment {
        GOPATH = "${env.WORKSPACE}/go"
        PATH = "${env.PATH}:${GOPATH}/bin:/usr/local/go/bin"
    }

    tools {
        go 'Go installation' // Name of the Go installation configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // git 'https://github.com/maplepoet/GoDev.git'
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/main']],
                          userRemoteConfigs: [[url: 'https://github.com/maplepoet/GoDev.git']]
//                        userRemoteConfigs: [[url: 'https://github.com/your-username/your-repo.git',credentialsId: 'your-credentials-id']]
                ])
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'go mod tidy'
            }
        }

        stage('Test') {
            steps {
                sh 'go test ./...'
            }
        }

//         stage('Run Tests') {
//                     parallel {
//                         stage('Test main package') {
//                             steps {
//                                 sh 'go test -v ./main_test.go'
//                             }
//                         }
//                         stage('Test another package') {
//                             steps {
//                                 sh 'go test -v ./another_test.go'
//                             }
//                         }
//                         stage('Test utils package') {
//                             steps {
//                                 sh 'go test -v ./utils/utils_test.go'
//                             }
//                         }
//                     }
//                 }

        stage('Build') {
            steps {
                sh 'go build -o myapp'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'myapp', allowEmptyArchive: true
            }
        }
    }
}
