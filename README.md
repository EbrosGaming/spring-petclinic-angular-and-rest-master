# Dokumentation för att köra alla testmiljöer i Jenkins

Man kan antingen köra Jenkins **lokalt** eller så kan man använda en **dedikerad server.** 

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















