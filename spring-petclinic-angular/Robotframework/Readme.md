# PetClinic Angular testing using ROBOT

## Prerequiste:
### GIT should be installed and configured.
#### Steps to clone the source:
1.	Start command prompt
2.	Set the location in command to clone the source (cd <source_location>)
3.	Execute the following command
 git clone https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git

___________________________________________________________
# Setup enviroment
## Start the Rest Service
#### Steps:
1.	Start command prompt
2.	Browse to source cloned location. (cd <source_location>)
3.	Browse to ..cd <source_location>\spring-petclinic-rest-master\spring-petclinic-rest-master
4.	Execute the following command:
   maven spring-boot:run  ## not working? try using mvn spring-boot:run 



Setup enviroment
Start the Angular Service

Enter into the static-content directory (by running cd spring-petclinic-angular/static-content), run one of the following commands to run a simple web server on port 4200:

### Method 1 : using java
curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar
java -jar ./rawhttp.jar serve . -p 4200

### Method 2 : using python3
###### python -m http.server 4200

### Method 3 : using python2
###### python -m SimpleHTTPServer 4200

### Method 4 : using ruby
###### ruby -run -ehttpd . -p4200

### Method 5 : using npm
###### npm install -g http-server
###### http-server -p 4200


# Create task

1	Open PyCharm

2	Add the git clone of https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git to the Version Control on Pycharm


![image](https://user-images.githubusercontent.com/77296147/119493090-1dd5e800-bd60-11eb-844d-1ffb0e5d172c.png)


3	Now the folder should be added to projects and look like this

 ![image](https://user-images.githubusercontent.com/77296147/119493242-49f16900-bd60-11eb-9f02-501a4af05dae.png)



4	Make sure you are working in your local branch

![image](https://user-images.githubusercontent.com/77296147/119493265-4f4eb380-bd60-11eb-892a-2123a4d0dcd9.png)




5	Now you have access to the keywords file that the whole team uses.

6	Add your task to the Tests folder by creating a new file into it

![image](https://user-images.githubusercontent.com/77296147/119493294-570e5800-bd60-11eb-9ba7-e2f8b3781bf8.png)



7	Use the keywords from Resources 
8	In documentation describe your test
9	Use variables and avoid hardcoding

![image](https://user-images.githubusercontent.com/77296147/119493327-5ecdfc80-bd60-11eb-96fd-f83fe8d300d0.png)


10	Describe the testcase in documentation
11	Use Tags for to easier get to/understand which test it is
12	Use gherkin syntax when writing the testcase

 ![image](https://user-images.githubusercontent.com/77296147/119493360-67bece00-bd60-11eb-9ca6-0d3c2dac5125.png)

# Commit and push

1	When you have run your test in the terminal and it passes

2	Then commit and push it to your branch

 # Push to main branch
1.If your test gets greenlight in the review then you can push it to the main branch

2.Now you can continue with the next task in jira
