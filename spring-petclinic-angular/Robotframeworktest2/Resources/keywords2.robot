*** Keywords ***
Test Navigates to chrome Home Page
Begin WebTest
    OPEN BROWSER                                       about:blank                         headless chrome
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
    Set Selenium Speed                               .25
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
    Set Selenium Speed                               .25
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

#--------------------------------------------------------------------------------------------------------------------------
#Change/Edit Pet Type
User Clicks On PetTypes
        Go To Web Page
        Click Element                                    xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
User Edit's A Pet Type
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
        TearDown After Verifying
User Verifies Edited Pet Added
       ${Edited_PetType_Updated}                        get text                               xpath://*[@id="3"]
       Should Contain                                   ${New_Edited_PetType_Name}              ${Edited_PetType_Updated}
TearDown After Verifying
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${Old_PetType_Name}
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
        ${link_text}                                    Get Title
        Should Not Be Equal                             ${Verify_Old_PetType_existed}        ${link_text}
        TearDown After Verifying
        TearDown Second Edited PetType After Verifying
TearDown Second Edited PetType After Verifying
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[6]/td[2]/button[1]
        Input Text                                       id=name                              ${Second_Old_petType_name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]

#____________________________________________________________________________________________________
  #Get back to landing page from pet type

user is on landing page

  go to web page

user enters pet types

  Click Element                            xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
  wait until page contains                 Pet Types

click on the home button

  Click element                            xpath://html/body/app-root/div[1]/nav/div/ul/li[1]/a


the user should return to the landing page

  page should contain                      Welcome to Petclinic


End Web Test
    close browser
