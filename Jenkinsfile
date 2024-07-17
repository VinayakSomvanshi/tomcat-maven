pipeline {
    agent any

    stages {
        stage('clean') {
            steps {
                // Run the maven build
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean"
            }
        }
   
        stage('compile') {
            steps {
                // Run the maven build
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore compile"
            }
        }
   
        stage('testing') {
            steps {
                // Run the maven build
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore test"
            }
        }
   
        stage('packing') {
            steps {
                // Run the maven build
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore package"
            }
        }
   
        stage('Test-Result') {
            steps {
                // Run the maven build
                junit 'target/surefire-reports/*.xml'
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
            currentBuild.result = 'FAILURE'
        }
    }
}
