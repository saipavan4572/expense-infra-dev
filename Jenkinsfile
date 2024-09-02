pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        //timeout(time: 5, unit: 'SECONDS')
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()  // it will not allow concurrent builds
        ansiColor('xterm')
    }

    parameters {
        choice(name: 'action', choices: ['Apply', 'Destroy'], description: 'Pick something')
    }


    stages {
        stage('Init') {
            steps {
                // sh """
                // ls -ltr
                // """
                sh """
                 cd 01-vpc
                 terraform init -reconfigure

                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                cd 01-vpc
                terraform plan
                """
            }
        }
        stage('Deploy') {
            input {
                message "Should we continue?"
                ok "Yes, we should."
            }
            steps {
                
                sh """
                cd 01-vpc
                terraform apply -auto-approve
                """

            }
        }

    }

    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()     // workspace has to be deleted after every build to avoid issues for next builds
        }
        success { 
            echo 'I will say Hello only when it is success!'
        }
        failure { 
            echo 'I will say Bye when it is failed!'
        }
    }

}