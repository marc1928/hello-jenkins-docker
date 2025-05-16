pipeline {
    agent any

    environment {
        REGISTRY = 'docker.io/marcbassi'
        IMAGE = 'apphelloworld'
        TAG = "${env.BUILD_ID}"
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Build image') {
            steps {
                script {
                    
                    img = docker.build("${REGISTRY}/${IMAGE}:${TAG}", ".")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    
                    withDockerRegistry(credentialsId: 'registry_docker', url: 'https://index.docker.io/v1/') {
                    
                        img.push('${TAG}')
                    }
                }
            }
        }
    }
}
