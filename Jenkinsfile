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
                                      usernameVariable: 'vinayak',
                                      passwordVariable: 'shamballa')]) {
                    sh "scp target/*.war vinayak@192.168.1.72:/usr/local/tomcat/webapps/"
                }
            }
        }
    }
}
