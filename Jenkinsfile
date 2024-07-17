pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh "mvn clean install -Dmaven.test.skip=true"
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war'
            }
        }

        stage('Deploy on Tomcat via SSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'tomcatCreds',
                                      usernameVariable: 'aastha',
                                      passwordVariable: '123456')]) {
                    sh "scp -vvv -o 'StrictHostKeyChecking no' target/*.war aastha@192.168.1.49:/usr/local/tomcat/webapps/"
                }
            }
        }
    }
}
