


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
 
 ![Swagger_url](https://user-images.githubusercontent.com/77210719/119680611-a24c6780-be41-11eb-9618-d83bcd4c7f05.PNG)
 
 









## Postman configuration

### Prerequiste: 
Postman App or extension should be installed.

### Steps to configure Postman:
### 1. Launch Postman app

### 2. Create Postman workspace

 ### 2.1 : Click New workspace
 
 ![createWorkspace](https://user-images.githubusercontent.com/77210719/119680760-c314bd00-be41-11eb-800c-d79cee19a5bf.png)
 
 ### 2.2 : Provide details and create 
 
 ![createWorkspaceDialog](https://user-images.githubusercontent.com/77210719/119680890-e2134f00-be41-11eb-99d8-a25f78e148f6.png)
 
 ### 3. Import following files into workspace
 
 ![import_button_image](https://user-images.githubusercontent.com/77210719/119681099-0c650c80-be42-11eb-97c3-0ea7f1f3108e.PNG)
 
 ## Files : 
 
	Spring_PetClinic.postman_collection.json
	PetClinic_Environment.postman_environment.json
	
 
 ![Petclinc_postman_collection](https://user-images.githubusercontent.com/77210719/119681108-0f5ffd00-be42-11eb-8173-75cbd2dcf5a8.png)
 
 ![Petclinc_postman_environment](https://user-images.githubusercontent.com/77210719/119681118-1129c080-be42-11eb-9e67-e74d02241409.png)
 

 
 
 ### 4: Test Suite execution
![executeTestsuite](https://user-images.githubusercontent.com/77210719/119681091-0a02b280-be42-11eb-9b83-762776af894d.png)
 
 







	


