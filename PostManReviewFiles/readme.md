# PetClinic API testing using POSTMAN

## PetClinic_Environment.postman_environment.json :
           This environment file consists of generic variables used across all the API test scenarios.


## Spring_PetClinic.postman_collection.json:
	  This collection file consists all postman test scripts for PetClinic APIs.


### //Source code
### **Prerequiste**:
	  GIT should be installed and configured.

### Steps to clone the source:
	 Start command prompt
	 Set the location in command to clone the source (cd <source_location>)
	 Execute the following command
	 ***git clone  https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git***



### Setup enviroment

**Start the Rest Service**

### Steps:
	Start command prompt
	Browse to source cloned location. (cd <source_location>)
	Browse to ..cd <source_location>\spring-petclinic-rest-master\spring-petclinic-rest-master
	Execute the following command
### maven spring-boot:run

### Verify Swagger File:
	Launch a browser and access the following URL [http://localhost:9966/petclinic/]
	

## Postman configuration

### Prerequiste: 
	Postman App or extension should be installed.

### Steps to configure Postman:
       Launch Postman app
       Create Postman workspace
       Import following files into workspace
		Location :<source_location>\PostmanFiles
   ### Files : 
		PetClinic_Environment.postman_environment.json
	        Spring_PetClinic.postman_collection.json




//Add new test scenario to collection
