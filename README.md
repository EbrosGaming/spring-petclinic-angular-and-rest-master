#  EbrosGaming/spring-petclinic-angular-and-rest-master Repository
Infotiv's project for IT-Högskolan's test automation course 2021 
 
![alt petclinic-junit](git-res/infotiv.png) ![alt petclinic-junit](git-res/iths.png)


## Test Automation and Agile Methodologies Project By Team C ( MT20 - ITHögskolan )
###### Developed By Isac Ojaniemi , Jonna Hagberg , Adam Ballard , Pravalika , Swetha Rani Pannala , Sami Khelifi , Renu Ghumare


#### SpringPetclinic Application is to maintain the Information about Pets ,Pet Types , Owners of the Pets, Reasons for PetClinic Visits and Veternarians and their Specialties.```EbrosGaming/spring-petclinic-angular-and-rest-master Repository``` contains Subfolders for Spring petclinic Angular And pring petclinic Rest master. 

Spring-petlinic-angular > : is the front end application which is a client only. First you need to start REST Petclinic backend Api server before starting frontend application.
```Robotframework``` folder in spring-petclinic-angular,  contains the Robot framework test suites to execute the UI test cases in which all keywords used in testcases are stored in a single robot keywords file, named PetclinicKeywords.robot . There is a separate readme file for Robotframework at https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master/blob/main/spring-petclinic-angular/Robotframework/Readme.md .

Spring-petclinic-rest-master > : is the backend version of the Spring Pet clinic application which provides only REST API.
```PostmanFiles``` folder, contains the Collection of requests and an Environment used to execute backend test cases using REST Api. There is a separate reademe file for Postman at https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master/tree/main/PostmanFiles .

Jenkinsfile in the repository contains the script with the stages of execution script. The names of the stages are described with names tu build environment for all types of tests, which are self explaining.There are certain steps followed in stage, which will follow the script and commands to be exucted in the step. .

Stage  - ```Build Rest-API``` - is used to start the backend of the application . Command used is 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &' to connect to local server http://localhost:9966/petclinic/v2/api-docs.

Stage  - ```Build Angular-Front End``` - is used to start the front end application to use in Web Browser. Command``` 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &' ```  is used to run the web application on localhost http://localhost:4200/petclinic/welcome.

Stage  - ```Build JUnit``` -  and - ```JUnit``` - are used for unit tests to compile and run automatically during regression testing in Jenkins.

Stage  - ```Robot``` - is used to execute the front end web application test cases through web browser .Command  used is 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Robotframework/Tests/Results spring-petclinic-angular/Robotframework/Tests' to run with Chrome browswer. Test results and failures are notified in Results folder.

Stage  - ```Postman``` - is used to run the backend test cases using rest API. Command used is 'newman run PostmanFiles/Spring_PetClinic.postman_collection.json -e PostmanFiles/PetClinic_Environment.postman_environment.json -- reporters junit' to execute the Rest API test cases in the Spring Petclinic Postman collection.

```Post``` is to post the Success or failure of test results reports of the test cases via email.

Test cases for Spring Petclinic can be executed with Jenkins pipeline, - Group C- PetClinic - is the pipeline, we have Created at ithsjenkins serverwhich clearly shows build stages and test execution success. 
