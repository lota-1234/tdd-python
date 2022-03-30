pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage("Init Stage") {
            steps {
                script {
                    sh 'echo "-------------initialize project-----------------"'
                    sh 'pip3.8 install virtualenv'
                    sh 'source venv/bin/activate'
                    sh 'pip3.8 install -r requirements.txt'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'pip3.8 install wheel'
                sh 'python3.8 setup.py bdist_wheel'
            }
        }
        stage('Test') {
            steps {
                sh 'pip3.8 install pytest coverage'
                sh 'py.test --junit-xml test-reports/results.xml'
/*                 sh 'pytest'
                sh 'coverage run -m pytest'
                sh 'coverage report'
                sh 'coverage html' */
            }
             post {
                always {
//                     junit 'htmlcov/index.html'
                    junit 'test-reports/results.xml'
                }
            }
        }
      /*  stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        } */
        stage('Deploy - Staging') {
            steps {
                sh 'chmod u+x deploy_staging.sh'
                sh './deploy_staging.sh'
//                 sh './run-smoke-tests'
            }
        }
        stage('Deploy - Dev') {
            steps {
                sh 'chmod u+x deploy_dev.sh'
                sh './deploy_dev.sh'
                sh 'echo "-------------CICD Completed-------------"'
            }
        }
    }
     environment {
        EMAIL_TO = 'lutfunnaharlota@gmail.com, s.parvin@pipelinesecurity.net, a.singh@pipelinesecurity.net'
    }

     post {
         failure {
               emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}',
                        to: "${EMAIL_TO}",
                        subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
            }
        unstable {
               emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}',
                to: "${EMAIL_TO}",
                subject: 'Unstable build in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
        }
        changed {
            emailext body: 'Check console output at $BUILD_URL to view the results.',
                    to: "${EMAIL_TO}",
                    subject: 'Jenkins build is back to normal: $PROJECT_NAME - #$BUILD_NUMBER'
        }
    }

}