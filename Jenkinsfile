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
                sh 'echo This is Test stage'
                sh 'sleep 10'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo This is Deploy stage'
            }
        }

    }

    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        success { 
            echo 'I will say Hello only when it is success!'
        }
        failure { 
            echo 'I will say Bye when it is failed!'
        }
    }

}