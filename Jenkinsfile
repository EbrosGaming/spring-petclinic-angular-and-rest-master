pipeline {
    agent any
    stages {
        stage('parallel') {
                   parallel {
                     stage('Build Rest-API')
                              {
                                steps {
                                    sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &'
                                    sh 'sleep 11'
                                      }
                               }

                    stage('Build Angular-Front End') 
                               {
                                 steps {
                                    sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                                    sh 'sleep 11'
                                       }
                               }                            
               
       
   
                    stage('Robot')
                       {
                                  steps {
                                     catchError {
                                                sleep(60)   
                                                sh 'robot --variable BROWSER:headlesschrome -d Tests/Results Tests'
                                                }
                                         }     
                                  post {
                                     always {
                                        script {
                                             step(
                                                 [
                                                    $class                  :   'RobotPublisher',
                                                    outputPath              :   'Tests/Results',
                                                    outputFileName          :   '**/output.xml',
                                                    reportFileName          :   '**/report.html',
                                                    logFileName             :   '**/log.html',
                                                    disableArchiveOutput    :   false,
                                                    passThreshold           :   100,
                                                    unstableThreshold       :   40,
                                                    otherFiles              :   "**/*.png,**/*.jpg",
                                                 ]
                                                 )
                                               }
                                            }
                                        }
                        }
      
                     stage('Postman') 
                       {
                         steps {
                         sh 'newman run PostmanFiles/PCollection.postman_collection.json -e PostmanFiles/PEnvironment.postman_environment.json -- reporters junit'
                               }
                          post {
                            always {
                                        junit '**/*.xml'
                                   }
                                }
                        } 
               
             }
  }
}
