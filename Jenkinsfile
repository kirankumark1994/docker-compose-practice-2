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
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.201.211.213  \n ")
                   sh '''#!/bin/bash



                  VAR_1=$(docker ps | awk \'F " " {print $8}\' | sed -n \'2p\')
                  VAR_2=$(docker ps | awk \'F " " {print $7}\' | sed -n \'3p\')


                 if [ $VAR_1 = $VAR_2 ]; then
                 echo "Deployement is success"
                 else
                 echo "Deployement is failure"

                 fi


                echo "$VAR_1    and $VAR_2"

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
