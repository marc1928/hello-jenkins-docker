pipeline {
    agent any

    environment {
        REGISTRY = 'marcbassi'
        IMAGE = 'apphelloworld'
        TAG = "${env.BUILD_ID}"
        PORT = 8012
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
                        //img.push('${TAG}')
                        img.push("latest")
                    }
                }
            }
        }

        stage('Run container') {
            steps {
                script {
                    container = img.run("--name hellowrold_${BUILD_ID} -p ${PORT}:8080")
                    echo "Conteneur lancé : http://172.16.150.20:${PORT}/hello"
                }
            }
        }             
    }
}
