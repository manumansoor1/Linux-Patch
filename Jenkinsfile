pipeline {
    agent any

    stages {
        stage('Run Patch on Remote Server') {
            steps {
                echo "Starting remote patching..."

                sh '''
                set -e

                echo "Making script executable"
                chmod +x patch.sh

                echo "Copying script to remote server"
                scp -i /home/ec2-user/.ssh/id_rsa -o StrictHostKeyChecking=no patch.sh ec2-user@18.61.156.128:/tmp/

                echo "Executing patch script on remote server"
                ssh -i /home/ec2-user/.ssh/id_rsa -o StrictHostKeyChecking=no ec2-user@18.61.156.128 "
                    chmod +x /tmp/patch.sh && sudo /tmp/patch.sh
                "

                echo "Patching completed"
                '''
            }
        }
    }
}
