# PetClinic API testing using POSTMAN

## PetClinic_Environment.postman_environment.json :
This environment file consists of generic variables used across all the API test scenarios.


## Spring_PetClinic.postman_collection.json:
This collection file consists all postman test scripts for PetClinic APIs.


## Source code
### Prerequiste:
GIT should be installed and configured.

### Steps to clone the source:
1. Start command prompt

2. Set the location in command to clone the source (cd <source_location>)

3. Execute the following command

		git clone https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git



## Setup enviroment

**Start the Rest Service**

### Steps:
1. Start command prompt

2. Browse to source cloned location. (cd <source_location>)

3. Browse to ..cd <source_location>\spring-petclinic-rest-master\spring-petclinic-rest-master

4. Execute the following command

              maven spring-boot:run  ## not working? try using mvn spring-boot:run 

### Verify Swagger File:

Launch a browser and access the following URL :

 http://localhost:9966/petclinic/
 
 ![Swagger](git_res/Swagger_url.PNG)
 
 
 
 
	

	

## Postman configuration

### Prerequiste: 
Postman App or extension should be installed.

### Steps to configure Postman:
### 1. Launch Postman app

### 2. Create Postman workspace

 ### 2.1 : Click New workspace
 
 ![Create_workspace](git_res/createWorkspace.png)
 
 ### 2.2 : Provide details and create 
 
 ![Create_workspace_Dailog](git_res/createWorkspaceDialog.png)
 
 ### 3. Import following files into workspace
 
 ![Import_button](git_res/ImportFiles.png)
 
 ## Files : 
 
	Spring_PetClinic.postman_collection.json
	PetClinic_Environment.postman_environment.json
	
 
 ![Postman_collection_file](git_res/Petclinc_postman_collection.png)
 
 ![Postman_environment_file](git_res/Petclinc_postman_environment.png)
 
 
 ### 4: Test Suite execution
 ![Run_Tests](git_res/executeTestsuite.png)
 
 







	


