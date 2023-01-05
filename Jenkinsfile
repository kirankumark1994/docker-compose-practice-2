pipeline{
    agent any
    stages{
        stage("Checkout"){
            steps{
                echo "========executing Checkout========"
            }
            
        }
        stage("Deploy"){
            steps{
                echo "========executing Deploy========"
            }
            
        }
        stage("Status"){
            steps{
                echo "========executing Status========"
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
