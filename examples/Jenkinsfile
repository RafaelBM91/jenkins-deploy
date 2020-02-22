pipeline {
    agent none
    environment {
        NODE_ENV = 'development'
    }
    stages {
        stage('Build Code') {
            agent {
                docker {
                    image 'node:latest'
                }
            }
            stages {
                stage('Dependencies') {
                    steps {
                        sh 'npm install'
                    }
                }
                stage('Build') {
                    steps {
                        sh 'npm run build'
                    }
                }
                stage('Statics') {
                    steps {
                        sh 'cp package.json dist'
                        sh 'cp Dockerfile dist'
                    }
                }
            }
        }
        stage('Build Image') {
            agent any
            stages {
                stage('Build') {
                    steps {
                        script {
                            docker.build("${IMAGE_NAME}:${IMAGE_VERSION}", "dist/")
                        }
                    }
                }
                stage('Run') {
                    steps {
                        sh "docker stop ${IMAGE_NAME}-container || true && docker rm ${IMAGE_NAME}-container || true"
                        script {
                            docker.image("${IMAGE_NAME}:${IMAGE_VERSION}").run("--name ${IMAGE_NAME}-container -p ${PORTS_CONTAINER}")
                        }
                    }
                }
            }
        }
    }
}
