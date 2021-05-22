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
                      }
                }
        
        stage('Test') {
            steps {
                 sh 'cd spring-petclinic-rest && mvn test'
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }

        }
        
        
        
        stage('Postman') {
            steps {
                sleep(20)
		 catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                sh 'newman run PostManReviewFiles/PetClinic_Swagger.postman_collection.json -e PostManReviewFiles/PetClinic_Swagger.postman_environment.json -- reporters junit'
            }
	    }

        
        post {
			 always {
				junit '**/*xml'
					}
				}
        }
        
        
       
        
        stage('Robot') {
            steps {
                sleep(20)
		 
                sh 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Results spring-petclinic-angular/Tests'
            }
            post {
                always {
                    script {
                        step(
                            [
                               $class                  :   'RobotPublisher',
                                outputPath              :   'spring-petclinic-angular/Results',
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
	    
	    
    } //this is for stages
	
	
	 post{
		success {
			emailext body: "Job Success - \"${env.JOB_NAME}\" build: ${env.BUILD_NUMBER}\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}",
                                 subject:  " Build: ${env.JOB_NAME} - success",
   				 to: 'pravalika6882@gmail.com'
		}
		 
               failure {
			emailext body: "Job Failed - \"${env.JOB_NAME}\" build: ${env.BUILD_NUMBER}\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}",
                                 subject: 'Build: ${env.JOB_NAME} - failure"',
   				 to: 'pravalika6882@gmail.com'
		}
	    		 
		 
	 }
	    
	
	    
	    
	    
	    
		
	    
	
	 
    
}
        
