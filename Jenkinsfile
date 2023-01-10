pipeline{
    agent any
    
    
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
                    
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.201.211.213 \"mkdir -p /home/ubuntu/compose-deployment-2/ \" ")
                    sh(script:"scp -r ${WORKSPACE}/* ubuntu@44.201.211.213:/home/ubuntu/compose-deployment-2/ ")
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.201.211.213 \"cd /home/ubuntu/compose-deployment-2/ && sudo docker-compose up -d \" ")
                }
                
            }
            
        }
        stage("Status"){
            steps{
                echo "========executing Status========"
                script{
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.201.211.213 && cd /home/ubuntu/compose-deployment-2 \n ")
                sh '''#!/bin/bash
                   PROMETHEUS=`docker-compose ps -q prometheus`
                   GRAFANA=`docker-compose ps -q grafana`
                   if [[ "$PROMETHEUS" != "" ]] &&  [[ "$GRAFANA" != "" ]] 
                   then
                   echo "The service $PROMETHEUS and $GRAFANA is running!!!"
                   else
                   echo "failure"
 
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
