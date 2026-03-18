pipeline {
    agent any

    stages {
        stage('Run Patch on Remote Server') {
            steps {
                echo "Starting remote patching..."

                sh '''
                set -e

                echo "Making script executable"
                chmod +x httpd.sh

                echo "Copying script to remote server"
                scp -i /var/lib/jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no docker.sh ec2-user@18.61.156.128:/tmp/

                echo "Executing patch script on remote server"
                ssh -i /var/lib/jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no ec2-user@18.61.156.128 "
                    chmod +x /tmp/docker.sh && sudo /tmp/docker.sh
                "

                echo "Patching completed"
                '''
            }
        }
    }
}
