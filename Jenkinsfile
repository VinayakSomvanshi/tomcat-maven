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

        stage('deployment') {
            steps {
                deploy adapters: [tomcat9(url: 'http://192.168.1.72:8888/manager/', 
                    credentialsId: 'tomcatCreds')], 
                    war: 'target/*.war', 
                    contextPath: 'vinayak'
            }
        }

    }
}
