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
                    sh '''#!/bin/bash
                       VAR1=docker ps -a | awk \'F " " {print $7}\' | sed -n 2p
                       VAR2=docker ps -a | awk \'F " " {print $8}\' | sed -n 3p
                       if [ $VAR1 == $VAR2 ]
                       then
                       echo "success"
                       else
                       echo "failure"
                       fi
                       '''
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
