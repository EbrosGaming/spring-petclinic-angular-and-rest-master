 pipeline {
    agent any
    stages {
        stage('Build Rest-API') {
                    steps {
                        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &'
                    }
                }
	stage('Build Angular-Front End') {
            steps {
                sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                sh 'sleep 20'

            }
        }
         
        stage('Postman') {
            steps {
            	catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
            		sh 'newman run PostmanFiles1/Sprint2/Spring_PetClinic.postman_collection.json -e PostmanFiles1/Sprint2/PetClinic_Environment.postman_environment.json -- reporters junit'
            	}
            }
        }

        stage('Robot') {
            steps {
            	catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                	sh 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/RenuRobot/Tests/Results spring-petclinic-angular/RenuRobot/Tests'
                }
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'spring-petclinic-angular/Robotframework/Tests/Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
        }
    }

    post{
        success{
        	emailext (
            	subject: "PASSED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                		<p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                to: "jenkins.iths.mailer@gmail.com"
            )
        }
        failure{
        	emailext (
            	subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
            	body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
            			<p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
            	to: "jenkins.iths.mailer@gmail.com"
            )

        }
    }
}
