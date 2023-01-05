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
                    //withCredentials([sshUserPrivateKey(credentialsId: 'docker-ssh-key-2', keyFileVariable: 'docker-ssh-key-2', passphraseVariable: 'docker-ssh-key-2', usernameVariable: 'ubuntu')]) {
                    sh(script: “ssh -i  ubuntu@54.166.242.36 \” data\"")
                    //}
                }
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
