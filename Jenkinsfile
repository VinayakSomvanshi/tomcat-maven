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
                sh "ssh -T 'vinayak@192.168.1.72' /usr/local/bin/./shutdown.sh"
            }
        }
        
        stage('War File Deployment') {
            steps {
                sh "scp target/*.war 'vinayak@192.168.1.72':/usr/local/webapps/"
            }
        }
        
        stage('Start Tomcat') {
            steps {
                sh "ssh -T 'vinayak@192.168.1.72' /usr/local/bin/./startup.sh"
            }
        }
    }

    post {
        success {
            echo "Build successful!"
            notify('Success')
        }
        failure {
            echo "Build failed!"
            notify("Error ${err}")
            error("Build failed!")
        }
    }
}
