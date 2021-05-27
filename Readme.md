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

# Dokumentation för att köra alla testmiljöer i Jenkins

Man kan antingen köra Jenkins **lokalt** eller så kan man använda en **dedikerad server.** 

## Hur Jenkinsfile funkar

Våran Jenkinsfile har 6 stages 

* Stage 1. Bygga upp Rest-API

  API:n gör så att vi kan hämta och spara information på hemsidan.

* Stage 2. Bygga upp Angular-Front End

  Anggular-Front är hemsidan PetClinic.

* Stage 3. Bygga upp jUnit test

  jUnit är enhetstester för olika enheter t.ex. Pet.java eller Owner.java

* Stage 4. Köra jUnit testerna

  Här kör vi de testerna och ser så att enheterna funkar och gör det dem ska.

* Stage 5. Köra Postman testerna

  Här testar vi så att vi kan hämta och ändra information via API:n.

* Stage 6. Köra RobotFW testerna

  Här testar vi så att vi kan ändra information genom hemsidan.

## Hur man kör alla testmiljöer **lokalt** i Jenkins

### Skapa ett pipelinejobb i Jenkins

1. Först så startar du Jenkins och sen logga in.

2. Sen klickar du på **Skapa nytt item.**

3. Ge jobbet ett namn och sen klickar du på **Pipeline** och sen **OK.**

4. Tryck sen på jobbet du nyss skapade.

5. Klicka nu på **Konfiguera.**

6. Skrolla nu ner tills du kommer till **Advances Project Options.**

7. Sen under **Definition** så väljer du **Pipeline script from SCM.**

8. Sen under **SCM** så väljer du **Git.**

9. Sen under **Repository URL** så skriver du in ```https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git```

10. Sen under **Branch Specifier** så ska det stå **main.** Sen klickar du på spara.
   
### Testa att köra Pipelinejobbet

1. Först så startar du Jenkins och sen logga in.

2. Gå sedan in på Pipelinjobbet som du skapade innan.

3. Sen är det bara att trycka på **Starta bygge nu.**

4. Om du har gjort allting rätt så borde ett bygge starta och du kan se vad den kör för test och hur lång tid det tar att köra varge test.

5. Om allt blir grönt så har alla testerna gått igenom som de ska och du är nu klar. Om någonting blir rött så fortsätt läsa.

6. Om något blir rött så har det testet inte gått igenom som det ska. Då kan du klicka på den röda rutan och klicka på **Logs** och sen trycker du på den röda rutan 
   som det står **Shell Script.** Här kan du se vad som gick fel. (Om det är mer en ett fel så kan du klicka på siffran under **Build History** sen klickar du på **Console Output.**
   Här kan du se allt som har körts och sen vad som gick fel.)

7. Om det var Robot testet som blev rött så kan du klicka på siffran under **Build History** och sen klickar du på **Robot Results.** Sen under **Results** så finns det
   log.html tryck på den. Där så kan du antingen ladda ner den eller så trycker du på log.html så borde en test log öppnas och här kan du se exakt var och när felet inträffade.


## Hur man kör alla testmiljöer på en **dedikerad Jenkins server**

### Skapa ett pipelinejobb i Jenkins

1. Först så startar du Jenkins och sen logga in.

2. Sen klickar du på **Skapa nytt item.**

3. Ge jobbet ett namn och sen klickar du på **Pipeline** och sen **OK.**

4. Tryck sen på jobbet du nyss skapade.

5. Klicka nu på **Konfiguera.**

6. Skrolla nu ner tills du kommer till **Advances Project Options.**

7. Sen under **Definition** så väljer du **Pipeline script from SCM.**

8. Sen under **SCM** så väljer du **Git.**

9. Sen under **Repository URL** så skriver du in ```https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git```

10. Sen under **Branch Specifier** så ska det stå **main.** Sen klickar du på spara.

### Testa att köra Pipelinejobbet

1. Först så startar du Jenkins och sen logga in.

2. Gå sedan in på Pipelinjobbet som du skapade innan.

3. Sen är det bara att trycka på **Starta bygge nu.**

4. Om du har gjort allting rätt så borde ett bygge starta och du kan se vad den kör för test och hur lång tid det tar att köra varge test.

5. Om allt blir grönt så har alla testerna gått igenom som de ska och du är nu klar. Om någonting blir rött så fortsätt läsa.

6. Om något blir rött så har det testet inte gått igenom som det ska. Då kan du klicka på den röda rutan och klicka på **Logs** och sen trycker du på den röda rutan 
   som det står **Shell Script.** Här kan du se vad som gick fel. (Om det är mer en ett fel så kan du klicka på siffran under **Build History** sen klickar du på **Console Output.**
   Här kan du se allt som har körts och sen vad som gick fel.)

7. Om det var Robot testet som blev rött så kan du klicka på siffran under **Build History** och sen klickar du på **Robot Results.** Sen under **Results** så finns det
   log.html tryck på den. Där så kan du antingen ladda ner den eller så trycker du på log.html så borde en test log öppnas och här kan du se exakt var och när felet inträffade.

