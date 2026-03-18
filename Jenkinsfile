pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/manumansoor1/Linux-Patch'
            }
        }

        stage('Run Patch on Remote Server') {
            steps {
                sh '''
                scp patch.sh ec2-user@18.61.156.128:/tmp/
                ssh ec2-user@18.61.156.128 "chmod +x /tmp/patch.sh && sudo /tmp/patch.sh"
                '''
            }
        }
    }
}
