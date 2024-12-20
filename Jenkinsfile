//#group members 
//Sai Vamshi Dasari-g01464718
//Aryan Sudhagoni-g01454180
//Lahari Ummadisetty-g01454186
pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "saivamshi1432/survey-webpage"
        DOCKER_TAG = "${DOCKER_IMAGE}:${BUILD_NUMBER}"
        DOCKER_REGISTRY = "https://index.docker.io/v1/"
        KUBE_CONTEXT = "arn:aws:eks:us-east-1:717279734829:cluster/cs645-cluster"
        KUBE_NAMESPACE = "default"
        KUBECONFIG = "/var/lib/jenkins/.kube/config"  // Explicit path to kubeconfig
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, 'dockerhub-cred') {
                        docker.image("${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-cred']]) {
                        sh '''
                        export TOKEN=$(aws eks get-token --region us-east-1 --cluster-name cs645-cluster | jq -r '.status.token')
                        kubectl config set-credentials eks-user --token=$TOKEN
                        kubectl config use-context ${KUBE_CONTEXT}

                        # Apply the initial deployment and service YAML files
                        kubectl apply -f deployment.yaml
                        kubectl apply -f service.yaml

                        # Update the deployment to use the dynamically tagged image
                        kubectl set image deployment/survey-deployment survey-container=${DOCKER_TAG} -n ${KUBE_NAMESPACE}

                        # Rollout status to confirm deployment
                        kubectl rollout status deployment/survey-deployment -n ${KUBE_NAMESPACE}
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up workspace
        }
    }
}
