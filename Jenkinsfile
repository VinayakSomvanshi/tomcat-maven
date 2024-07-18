pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Verify Sonar') {
            steps {
                sh "mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins -Dsonar.projectName='jenkins' -Dsonar.host.url=http://vinayak:9000 -Dsonar.token=sqp_0145fa339a556b0bc8e1e461885cf0cea62a5766"
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

        stage('Deployment') {
            steps {
                deploy adapters: [tomcat9(url: 'http://192.168.1.72:8888/', 
                    credentialsId: 'tomcatCreds')], 
                    war: 'target/*.war', 
                    contextPath: 'sonar'
            }
        }

    }
}
