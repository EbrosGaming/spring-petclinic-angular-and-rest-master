# Spring-petclinic-angular-and-rest-master

Man kan antingen köra Jenkins **lokalt** eller om man har en **dedikerad server** så kan man använda den. 

## Hur man kör alla testmiljöer **lokalt** i Jenkins
Det finns flera sätt att köra Jenkins. Nedan redgörs för hur man startar systemet genom att som
vanlig användare köra en så kallad WAR-fil. WAR står för Web application archive och en fil av den
typen innehåller de kompilerade javaklasser som utgör en webapplikation. I filen finns förutom själva
Jenkins också en så kallad servlet container och därmed allt som behövs för att köra systemet.

### Installation av Jenkin
1. Ladda ner filen jenkins.war från https://jenkins.io/download/ (klicka inte på Download utan
   leta efter Generic Java Package under LTS)
   
2. Starta ett skal eller en kommandotolk och ställ dig i samma katalog som filen jenkins.war
   ligger i
   
3. Starta Jenkins med kommandot ```java –jar jenkins.war --httpPort=8080```  
   (i) Siffran 8080 är den port som servern i vilken Jenkins kör skall lyssna på. Modifiera
   kommandot efter eget tycke om du redan har en server som lyssnar på port 8080
   eller av någon annan anledning vill bruka en annan port.
   
4. Starta en webläsare och navigera till adressen 127.0.0.1:8080
   (i) Ersätt 8080 med rätt port om du startade Jenkins på någon annan port.
   (ii) 127.0.0.1 är den så kallade loopback-adressen som alltid avser den lokala datorn.
   Den lokala datorn är också åtkomlig genom namnet localhost.

5. Följ instruktionerna som visas
   (i) Första gången Jenkins startas kommer den be om ett lösenord. Detta lösenord finns
   sparat i en fil på den lokala datorn och Jenkins talar om dess sökväg.
   (ii) Tacka ja till att installera föreslagna plugins

6. Notera att Jenkins skapar en katalog, .jenkins, i vilken systemet sparar konfiguration av sig
   själv och jobb, plugins samt resultat av varje bygge.
   
### Installation av Maven

1. Navigera till https://maven.apache.org/download.cgi och ladda ner någon av filerna märkt
   Binary archive.
   
2. Packa upp filen på en plats i ditt filsystem där du önskar ha den.

3. (Valfritt) Låt din PATH innehålla sökvägen till bin-katalogen i den uppackade
   katalogstrukturen.

4. (Obligatoriskt) Sätt JAVA_HOME.

5. Verifiera att allt fungerar som det skall genom att köra programmet mvn i en kommandotolk
   (i) Maven kommer förmodligen rapportera något om BUILD FAILURE och att No goals
   have been specified for this build. Detta är i sin ordning eftersom något Mavenprojekt inte har skapats än.
   
### Skapa ett pipelinejobb i Jenkins

1. Först så starta du Jenkins och sen logga in.

2. Sen klickar du på **Skapa nytt item.**

3. Ge jobbet ett namn och sen klickar du på **Pipeline** och sen **OK.**

4. Tryck sen på jobbet du nyss skapade.

5. Klicka nu på **Konfiguera.**

6. Skrolla nu ner tills du kommer till **Advances Project Options.**

7. Sen under **Definition** så väljer du **Pipeline script from SCM.**

8. Sen under **SCM** så väljer du **Git.**

9. Sen under **Repositories URL** så skriver du in ```https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git```

10. Sen under **Branch Specifier** så ska det stå **main.** Sen klickar du på spara.

### Installation av **Insticksmoduler** i Jenkins

1. Fösts så startar du Jenkins och sen logga in.

2. Klicka nu på **Hantera Jenkins.**

3. Klicka på **Hantera insticksmoduler.**

4. Sen klickar du på **Tillgängliga**

5. Sen får du söka efter **Robot Framework plugin** och sen **Maven Release Plug-in Plug-in** och installera dem.
   (Du behöver nog starta om Jenkins efter du har installerat dem)

6. Du behöver också installera **NodeJS.** Det gör du här https://nodejs.org/en/download/current/ och så väljer du den 
   versiones som passar ditt operativsystem.
   
7. Gå sedan igenom den installationen.

8. Efter du har installerat NodeJS så öppnar du en valfri kommandotolk. (Jag rekommendera att du anväder NodeJS egna)

9. Nu behöver du bara skriva in ```npm install -g newman``` för att installera **Newman** som andvänds för att köra Postman tester i Jenkins.
   För att se om det installerades korrekt så kan du skriva ```newman run -v``` då borde det stå villken version du har.
   
### Testa att köra Pipelinejobbet

1. Först så starta du Jenkins och sen logga in.

2. Gå sedan in på Pipelinjobbet som du skapade innan.

3. Sen är det bara att trycka på **Starta bygge nu.**

4. Om du har gjort allting rätt så borde ett bygge starta och du kan se vad den kör för test och hur lång tid det tar att köra varge test.

5. Om allt blir grönt så har alla testerna gått igenom som de ska och du är nu klar. Om någonting blir rött så fortsätt läsa.

6. Om något blir rött så har det testet inte gått igenom som det ska. Då kan du klicka på den röda rutan och klicka på **Logs.**
   Här kan du se vad som gick fel. (Om det är mer en ett fel så kan du gå klicka på siffran under **Build History** sen klickar du på **Console Output.**
   Här kan du se allt som har körts och sen vad som gick fel.)

7. Om det var Robot testet som blev rött så kan du klicka på siffran under **Build History** och sen klickar du på **Robot Results.** Sen under **Results** så finns det
   log.html tryck på den. Där så kan du antingen ladda ner den eller så trycker du på log.html så borde en test log öppnas och här kan du se exakt var och när felet inträffade.


## Hur man kör alla testmiljöer på en **dedikerad Jenkins server**
Det är mycket lättare att använda en dedikerad Jenkins server om man redan har en. 
(Om man inte har en så kan man föllja denna guiden https://www.ewebguru.com/web-hosting-blog/how-to-connect-to-a-dedicated-server-using-jenkins/)

### Skapa ett pipelinejobb i Jenkins

1. Först så går du in på sidan är din server kör Jenkins och sen logga in.

2. Sen klickar du på **Skapa nytt item.**

3. Ge jobbet ett namn och sen klickar du på **Pipeline** och sen **OK.**

4. Tryck sen på jobbet du nyss skapade.

5. Klicka nu på **Konfiguera.**

6. Skrolla nu ner tills du kommer till **Advances Project Options.**

7. Sen under **Definition** så väljer du **Pipeline script from SCM.**

8. Sen under **SCM** så väljer du **Git.**

9. Sen under **Repositories URL** så skriver du in ```https://github.com/EbrosGaming/spring-petclinic-angular-and-rest-master.git```

10. Sen under **Branch Specifier** så ska det stå **main.** Sen klickar du på spara.

### Testa att köra Pipelinejobbet

1. Först så går du in på sidan är din server kör Jenkins och sen logga in.

2. Gå sedan in på Pipelinjobbet som du skapade innan.

3. Sen är det bara att trycka på **Starta bygge nu.**

4. Om du har gjort allting rätt så borde ett bygge starta och du kan se vad den kör för test och hur lång tid det tar att köra varge test.

5. Om allt blir grönt så har alla testerna gått igenom som de ska och du är nu klar. Om någonting blir rött så fortsätt läsa.

6. Om något blir rött så har det testet inte gått igenom som det ska. Då kan du klicka på den röda rutan och klicka på **Logs.**
   Här kan du se vad som gick fel. (Om det är mer en ett fel så kan du gå klicka på siffran under **Build History** sen klickar du på **Console Output.**
   Här kan du se allt som har körts och sen vad som gick fel.)

7. Om det var Robot testet som blev rött så kan du klicka på siffran under **Build History** och sen klickar du på **Robot Results.** Sen under **Results** så finns det
   log.html tryck på den. Där så kan du antingen ladda ner den eller så trycker du på log.html så borde en test log öppnas och här kan du se exakt var och när felet inträffade.















