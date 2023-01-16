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
                    
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.204.31.147 \"mkdir -p /home/ubuntu/compose-deployment-2/ \" ")
                    sh(script:"scp -r ${WORKSPACE}/* ubuntu@44.204.31.147:/home/ubuntu/compose-deployment-2/ ")
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@44.204.31.147 \"cd /home/ubuntu/compose-deployment-2/ && sudo docker-compose up -d \" ")
                }
                
            }
            
        }
        stage("Status"){
            steps{
                echo "========executing Status========"
                script{
                    
                   sh '''
                    ssh -t ubuntu@44.204.31.147 <<'ENDSSH'


                     VAR_1=$(docker ps -f name=grafana | grep grafana)
                     VAR_2=$(docker ps -f name=prometheus| grep prometheus)

                     if [ -z "$VAR_1" ] || [ -z "$VAR_2" ]
                     then
                     echo "deployment is failure"
                     else
                     echo "deployement is success"
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
