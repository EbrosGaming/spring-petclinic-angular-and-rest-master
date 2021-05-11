*** Keywords ***
Test Navigates to chrome Home Page
Begin WebTest
    OPEN BROWSER                                       about:blank                         ${BROWSER}
    #Maximize Browser Window
    #Set Selenium Speed                                                                
Go To Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                            ${URL}
Verify Page Loaded
    ${actualTerm}                                     get text                          xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   ${Welcome_Message}                ${actualTerm}
All Owners
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
    Set Selenium Speed                               .25
Select A Owner From The List
    Set Selenium Speed                               .50
    Sleep                                             .10
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
    Set Selenium Speed                               .25
    Sleep                                            .10
Add New Pet
     Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[3]
Input New Pet Detalis
    Click Element                                    id=name
Pet Details
    [Arguments]                                      ${Pet_Name}                          ${Birth_Date}
    Name                                             ${Pet_Name}
    Birth Date                                       ${Birth_Date}
    Click Element                                    id=type
    Click Element                                    xpath://*[@id="type"]/option[2]
    Click Element                                    xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
    #Set Selenium Speed                                
Name
    [Arguments]                                       ${Pet_Name}
    Input Text                                        id=name                             ${Pet_Name}
Birth Date
    [Arguments]                                       ${Birth_Date}
    Input Text                                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input          ${Birth_Date}
#-----------------------------------------
Verify Pet Adedd To owner
   ${pet_added}                                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
   Should Contain                                    ${Verify_Pet_Added_1}                 ${pet_added}
   Delete Pet After Verifying
Delete Pet After Verifying
    Click Element                                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
#------------------------------------
Verify Pet Added To Invalid Owner
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
    ${link_text}                                    Get Title
    Should Not Be Equal                             ${Verify_Pet_Added_1}                  ${link_text}
    Delete Pet After Verifying in Invalid Owner
Delete Pet After Verifying in Invalid Owner
    All Owners
    Select A Owner From The List
    Delete Pet After Verifying
#--------------------------------
Verifying Pet Can Add Multiple Times
    ${2nd_Pet_Added}                                get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
    Should Be Equal                                 ${Verify_Pet_Added_2}                  ${2nd_Pet_Added}
    Delete Pet After Adding multiple Times And Verifying
Delete Pet After Adding multiple Times And Verifying
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
    #Click Back Button
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[1]
    Select A Owner From The List
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[3]/table/tr/td[1]/dl/button[2]
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
Deleting A Newly Added pet
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
    Verify Pet deleted
Verify Pet deleted
    ${Verify_DeletedPet}                            Get Title
    Should Not Be Equal                             ${Verify_Pet_Added_4}                  ${Verify_DeletedPet}
#-------------------------------------------------------------------------------------------------------------------------
Edit Owner
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[2]
Owner New Detalis
    [Arguments]                                    ${OwnerNew_Adress}                    ${OwnerNew_City}                    ${OwnerNew_Telephone}
    Adress                                         ${OwnerNew_Adress}
    City                                           ${OwnerNew_City}
    Telephone                                      ${OwnerNew_Telephone}
    Click Element                                  xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]
Adress
    [Arguments]                                    ${OwnerNew_Adress}
    Input Text                                     id=address                             ${OwnerNew_Adress}
City
    [Arguments]                                    ${OwnerNew_City}
    Input Text                                     id=city                               ${OwnerNew_City}
Telephone
    [Arguments]                                    ${OwnerNew_Telephone}
    Input Text                                     id=telephone                          ${OwnerNew_Telephone}
Verify Owner New Detalis Added
    ${OwnerNew_Details_Added}                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[2]/td
    Should Be Equal                                ${New_Adress}                        ${OwnerNew_Details_Added}

Verify Erorr Message Displayed Or Not
   ${Invalid_PhoneNo}                              get text                              xpath:/html/body/app-root/app-owner-edit/div/div/form/div[6]/div/span[2]
    Should Contain                                 ${ErorrMessage_AcceptsDigits}         ${Invalid_PhoneNo}
#--------------------------------------
Owner Detalis With Empty Box
    Press Keys                                     xpath://*[@id="address"]               CTRL+a+BACKSPACE
    [Arguments]                                    ${OwnerNew_Telephone}
    Only TelephoneNo                               ${OwnerNew_Telephone}
Only TelephoneNo
    [Arguments]                                    ${OwnerNew_Telephone}
    Input Text                                     id=telephone                          ${OwnerNew_Telephone}
Verify Erorr Messages With Red Box
   ${Required_message}                             get text                              xpath:/html/body/app-root/app-owner-edit/div/div/form/div[4]/div/span[2]
    Should Match                                 ${ErorrMessge_Required}                 ${Required_message}
#------------------------------------------------------------------------------------------------------------------------
that the user is on the landing page
    Go To Web Page
a user Creates a new owner
    Click Element                                  xpath://a[contains(text(),'Owners')]
    wait until page contains                       Owners
    Click Element                                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                       Owners
    Input Text                                     id=firstName                           ${Firstname}
    Input Text                                     id=lastName                            ${Lastname}
    Input Text                                     id=address                             ${Adress1}
    Input Text                                     id=city                                ${City1}
    Input Text                                     id=telephone                           ${Mobile1}
    Click Element                                  xpath://div/button[contains(string(), "Add Owner")]
a new owner should be created
    Click Element                                 xpath://a[contains(text(),'Owners')]
    wait until page contains                      Owners
    Click Element                                 xpath://a/span[contains(text(),'All')]
    page should contain                           ${Firstname}
#--------------------------------
#test 2
that the user has acces to the web page
    Go To Web Page
a user creates a new owner with variables instead of letters
    Click Element                                xpath://a[contains(text(),'Owners')]
    wait until page contains                     Owners
    Click Element                                xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                     Owners
    Input Text                                   id=firstName                              ${Firstname2}
    Input Text                                   id=lastName                               ${Firstname2}
    Input Text                                   id=address                                ${Adress2}
    Input Text                                   id=city                                   ${City2}
    Input Text                                   id=telephone                              ${Mobile2}
    Click Element                                xpath://div/button[contains(string(), "Add Owner")]
a new owner should be added to the list
    Click Element                                xpath://a[contains(text(),'Owners')]
    wait until page contains                     Owners
    Click Element                                xpath://a/span[contains(text(),'All')]
    wait until page contains                     All
    Page should contain                          ${Firstname2}
#_____________________________________
#test 3
user is on the landing page
    Go To Web Page
the user Creates a new owner
    Click Element                               xpath://a[contains(text(),'Owners')]
    wait until page contains                    Owners
    Click Element                               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                    Owners
put already existing personal data
    Input Text                                  id=firstName                                 ${Firstname}
    Input Text                                  id=lastName                                  ${Lastname}
    Input Text                                  id=address                                   ${Adress1}
    Input Text                                  id=city                                      ${City1}
    Input Text                                  id=telephone                                 ${Mobile1}
    Click Element                               xpath://div/button[contains(string(), "Add Owner")]
a duplicate of the owner should be added
    Click Element                              xpath://a[contains(text(),'Owners')]
    wait until page contains                   Owners
    Click Element                              xpath://a/span[contains(text(),'All')]
    page should contain                        ${Firstname}
#___________________________________
#test4
user is located on landing page
    Go To Web Page
the user creates new owner
    Click Element                            xpath://a[contains(text(),'Owners')]
    wait until page contains                 Owners
    Click Element                            xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                 Owners
use special signs for input in name field
    Click Element                            xpath://a[contains(text(),'Owners')]
    wait until page contains                 Owners
    Click Element                            xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                 Owners
    Input Text                               id=firstName                                   ${Firstname3}
    Input Text                               id=lastName                                    ${Lastname3}
    Input Text                               id=address                                     ${Adress2}
    Input Text                               id=city                                        ${City2}
    Input Text                               id=telephone                                   ${Mobile2}
    Click Element                            xpath://div/button[contains(string(), "Add Owner")]
the new owner should be created
    Click Element                           xpath://a[contains(text(),'Owners')]
    wait until page contains                Owners
    Click Element                           xpath://a/span[contains(text(),'All')]
    wait until page contains                All
    Page should contain                     ${Firstname3}
#------------------------------------------------------------------------------------------------------------------------
Select an owner
     ${Expecting_Owner1}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
     ${Expecting_Pet1}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
Inspect same owner and pet but click on different owner
     ${Expecting_Owner1}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
     ${Expecting_Pet1}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr
Click on different owner
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[7]/td[1]/a
Inspect on one owner and other's pet but click on same owner
     ${Expecting_Owner2}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
     ${Expecting_Pet2}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[5]/td[5]/tr
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[4]/td[1]/a
Select an owner with 2 pets
     ${Expecting_Owner3}                         Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
     ${Expecting_PetA}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[5]/tr[1]
     ${Expecting_PetB}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[5]/tr[2]
     Click element                               xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
Verify selected Owner is with rightful pet 1
     ${Actual_Pet1}                                Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner1}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     Should Be Equal                               ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Sleep                                         .5
Verify selected Owner is not with rightful pet 1 or test case fails
     ${Actual_Pet1}                                 Get Text      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner1}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     #Should Be Equal                                ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Should Not Be Equal                            ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Sleep                                          .5
Verify selected Owner is not with rightful pet 2 or testcase fails
     ${Actual_Pet2}                                 Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner2}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
    #Should Be Equal(testcase fails)                ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}
     Should Not Be Equal                            ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}
     Sleep                                          .5
Verify whether selected Owner is with rightful pet(2 pets)
     ${Actual_PetA}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[1]
     ${Actual_PetB}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner3}                            Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     Should Be Equal                             ${Expecting_Owner3}${Expecting_PetA}${Expecting_PetB}     ${Actual_Owner3}${Actual_PetA}${Actual_PetB}
     Sleep                                       .5
#--------------------------------------------------------------------------------------------------------------------------
#Change/Edit Pet Type
User Clicks On PetTypes
        Go To Web Page
        Sleep                                           .10
        Click Element                                    xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
User Edit's A Pet Type
        Sleep                                           .5
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
        TearDown After Verifying
User Verifies Edited Pet Added
       ${Edited_PetType_Updated}                        Get Text                               xpath://*[@id="3"]
       Should Contain                                   ${New_Edited_PetType_Name}              ${Edited_PetType_Updated}
TearDown After Verifying
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${Actual_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
User Edit's PetTypes with Same Name
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[6]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
User Verifies Same Pet Type Name Can Add Multiple Times
        User Verifies Edited Pet Added
        ${link_text}                                    Get Value                            xpath://*[@id="5"]
        Should Not Be Equal                             ${Verify_Old_PetType_existed}        ${link_text}
        TearDown After Verifying
        TearDown Second Edited PetType After Verifying
TearDown Second Edited PetType After Verifying
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[6]/td[2]/button[1]
        Input Text                                       id=name                              ${Second_petType_Acutal_name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
#------------------------------------------------------------------------------------------------------------------------
#Home Button From Veterinarians
User Clicks On Veterinarians Page
        Go To Web Page
        Sleep                                           .10
        Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/a
User Selects All
        Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
User Is At Veterinarians Page
        Sleep                                            .5
        Page Should Contain button                       Home
User Can Go Back To Home Page
        Click Element                                    xpath:/html/body/app-root/app-vet-list/div/div/div/button[1]
        Sleep                                           .5
User Back To Home Page
      Page should Contain                                ${Welcome_Message}
User Clicks On Edit Vet
       Sleep                                            .5
       Click Element                                    xpath://*[@id="vets"]/tbody/tr[5]/td[3]/button[1]
       #Page should Contain Element                      xpath://*[@id="vet_form"]/div[5]/div/button[2]
       Page Should Not Contain Button                   Home
       Sleep                                            .5
       Click Element                                    xpath://*[@id="vet_form"]/div[5]/div/button[2]
       User Can Go Back To Home Page
User Clicks On Add New
        Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
        Page Should Not Contain Button                   Home
        Sleep                                           .5
        Click Element                                  xpath://*[@id="vet"]/div[5]/div/button[1]
 #--------------------------------------------------------------------------------------------------------------------------------------------------
#Performance Task

User Adds An Owner
        Set Selenium Speed                               .25
        Go To Web Page
        A User Creates A New Owner
        Sleep                                          .2
User Verifies Owner Added
        Sleep                                          .2
        Page Should Contain Element                     xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a
User Adds Two Pets To An Owner
         Sleep                                          .3
         Click Element                                  xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a
         Add New Pet
         Input New Pet Detalis
         Pet Details                                    ${Give_New_PetName_1}                ${NewPet_BirthDate}
         Add New Pet
         Input New Pet Detalis
         Pet Details                                    ${Give_New_PetName_2}                ${NewPet_BirthDate}
User Verifies Two Pets Adedd To The owner
        ${pet_1_added}                                   get text                           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
        Should Contain                                   ${Verify_pet_1_Added}              ${pet_1_added}
        ${pet_2_added}                                   get text                            xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[1]
        Should Be Equal                                  ${Verify_Pet_2_Added}               ${pet_2_added}
User Removes a Pet
        Sleep                                           .3
        Click Element                                    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
User Verifies Pet Removed
        Page Should Not Contain button                   Venus
        Sleep                                            .3
        Tear Down
TearDown
        Click Element                                    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[2]

User Changes The Last Name
        Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[2]
        Click Element                                   id=lastName
        Input Text                                      id=lastName                          ${Updated_Last_Name}
        Click Element                                   xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]
User Verifies Updated Last Name
       ${Link_Text}                                     Get Text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
       Should Contain                                   ${Verify_Last_Name}                  ${Link_Text}



End Web Test
    close browser
