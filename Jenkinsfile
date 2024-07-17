pipeline {
    agent any

    environment {
        TOMCAT_USER = credentials('vinayak')
        TOMCAT_PASSWORD = credentials('shamballa')
        TOMCAT_HOST = '192.168.1.72'
        TOMCAT_PORT = '8888'
        WAR_PATH = 'target/*.war'
        CONTEXT_NAME = 'app'
    }

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

        stage('Deployment') {
            steps {
                script {
                    def curlResponse = sh (
                        script: '''#!/bin/bash
                        CURL_RESPONSE=$(curl -v -u $TOMCAT_USER:$TOMCAT_PASSWORD -T $WAR_PATH "http://$TOMCAT_HOST:$TOMCAT_PORT/manager/text/deploy?path=/$CONTEXT_NAME&update=true")
                        
                        if [[ $CURL_RESPONSE == *"FAIL"* ]]; then
                          echo "war deployment failed"
                          exit 1
                        else    
                          echo "war deployed successfully "
                          exit 0
                        fi
                        ''',
                        returnStatus: true
                    )

                    if (curlResponse != 0) {
                        error("WAR deployment failed.")
                    } else {
                        echo "WAR deployed successfully."
                    }
                }
            }
        }

    }
}
