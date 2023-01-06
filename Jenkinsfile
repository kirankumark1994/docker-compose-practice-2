pipeline{
    agent any
    environment {
        PATH = "$PATH:/snap/bin"
    }
    parameters {
        string defaultValue: 'master', description: 'Provide Branch Name', name: 'BRANCH'
    }

    stages{
        stage("Checkout"){
            steps{
                echo "========executing Checkout========"
                script{
                    sh(script: "git checkout ${BRANCH}")
                }
            }
            
        }
        stage("Deploy"){
            steps{
                echo "========executing Deploy========"
                script{
                    
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.203.87.102 \"mkdir -p /home/ubuntu/compose-deployment-2/ \" ")
                    sh(script:"scp -r ${WORKSPACE}/* ubuntu@44.203.87.102:/home/ubuntu/compose-deployment-2/ ")
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.203.87.102 \"cd /home/ubuntu/compose-deployment-2/ && sudo docker-compose up -d \" ")
                }
                
            }
            
        }
        stage("Status"){
            steps{
                echo "========executing Status========"
                script{
                    sh(script: "ssh -o StrictHostKeyChecking=no  ubuntu@44.203.87.102")
                    sh '''#!/bin/bash

                       RUN1=`docker-compose ps -q prometheus`
                       RUN2=`docker-compose ps -q grafana`

                       if [[ "$RUN1" != "" ]] &&  [[ "$RUN2" != "" ]]
                       then
                       echo "The service is running!!!"
                       else
                       echo "====++failure++++===="
                       fi'''
                }
            }
            
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
