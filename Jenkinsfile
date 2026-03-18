pipeline {
    agent any

    stages {
        stage('Run Patch on Remote Server') {
            steps {
                sh '''
                chmod +x patch.sh

                scp -i /home/ec2-user/.ssh/id_rsa -o StrictHostKeyChecking=no patch.sh ec2-user@18.61.156.128:/tmp/

                ssh -i /home/ec2-user/.ssh/id_rsa -o StrictHostKeyChecking=no ec2-user@18.61.156.128 "chmod +x /tmp/patch.sh && sudo /tmp/patch.sh"
                '''
            }
        }
    }
}
