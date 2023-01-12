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
                    
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@52.90.253.108 \"mkdir -p /home/ubuntu/compose-deployment-2/ \" ")
                    sh(script:"scp -r ${WORKSPACE}/* ubuntu@52.90.253.108:/home/ubuntu/compose-deployment-2/ ")
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@52.90.253.108 \"cd /home/ubuntu/compose-deployment-2/ && sudo docker-compose up -d \" ")
                }
                
            }
            
        }
        stage("Status"){
            steps{
                echo "========executing Status========"
                script{
                    sh(script:"ssh -o StrictHostKeyChecking=no  ubuntu@52.90.253.108")
                    sh(script:"sh script.sh")
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
