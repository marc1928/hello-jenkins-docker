pipeline {
    agent any

    environment {
        REGISTRY = 'marcbassi'
        IMAGE = 'apphelloworld'
        TAG = "${env.BUILD_ID}"
        PORT = 8011
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
                    container = img.run("-d -p ${PORT}:8080")
                    echo "Conteneur lancé : http://172.16.15.13:${PORT}/hello"
                }
            }
        } 
        //stage('Run clean') {
        //    steps {
        //        script {
        //            def containerName = "helloworld-${env.BUILD_ID}"
        //            sh "docker rm -f ${containerName} "
        //            // sh "docker run -d --name ${containerName} -p ${PORT}:8080 ${REGISTRY}/${IMAGE}:${TAG}"                    
        //            echo "Conteneur lancé : http://172.16.15.13:${PORT}/hello"
        //        }
        //    }
        //}               
    }
}
