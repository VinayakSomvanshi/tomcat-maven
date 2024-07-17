pipeline {
    agent any

    stages {
        stage('clean') {
            steps {
                // Run the maven build
                sh "mvn -Dmaven.test.failure.ignore clean"
            }
        }
   
        stage('compile') {
            steps {
                // Run the maven build
                sh "mvn -Dmaven.test.failure.ignore compile"
            }
        }
   
        stage('testing') {
            steps {
                // Run the maven build
                sh "mvn -Dmaven.test.failure.ignore test"
            }
        }
   
        stage('packing') {
            steps {
                // Run the maven build
                sh "mvn -Dmaven.test.failure.ignore package"
            }
        }
   
        stage('Stop Tomcat') {
            steps {
                sh "ssh -o StrictHostKeyChecking=no -T 'vinayak@192.168.1.72' /usr/local/tomcat/bin/./shutdown.sh"
            }
        }
        
        stage('War File Deployment') {
            steps {
                sh "scp -o StrictHostKeyChecking=no target/*.war 'vinayak@192.168.1.72':/usr/local/tomcat/webapps/"
            }
        }
        
        stage('Start Tomcat') {
            steps {
                sh "ssh -o StrictHostKeyChecking=no -T 'vinayak@192.168.1.72' /usr/local/tomcat/bin/./startup.sh"
            }
        }
    }
    }
}
