pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Clone Step'
                //git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/marc/myapp-j2e-g15.git'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Build Step'
                withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                sh 'mvn clean install package'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Hello World'
                deploy adapters: [tomcat9(credentialsId: 'id_tomcat', path: '', url: 'http://172.16.15.13:8042/')], contextPath: null, war: '**/*.war'
            }
        }
    }
}
