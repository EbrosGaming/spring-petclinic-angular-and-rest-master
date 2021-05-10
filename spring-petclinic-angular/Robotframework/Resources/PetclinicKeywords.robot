*** Keywords ***

Test Navigates to chrome Home Page

Begin WebTest

    OPEN BROWSER                                       about:blank                         ${BROWSER}
    #Maximize Browser Window
    Set Selenium Speed                                0.07

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

Select A Owner From The List

    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a

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
    Set Selenium Speed                                .5

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

     Sleep                                         .5
     ${Expecting_Owner1}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
     ${Expecting_Pet1}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr

Click on different owner

     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[7]/td[1]/a

Inspect on one owner and other's pet but click on same owner

     Sleep                                         .5
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

#------------------------------------
#Add Pet Type - Jonna

Go to Pet Types

    User is on the landing page
    Click element                                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a/span[2]
    Verify on the right page

Verify on the right page

    ${Actual_Pettypes_Page}                       Get Text    xpath:/html/body/app-root/app-pettype-list/div/div/h2
    Should be equal                               ${Actual_Pettypes_Page}   ${Expected_Pettypes_Page}

Add a new Pet Type

    Click button                                  xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
    Wait until page contains                      New Pet Type
    Click element                                 id:name
    Input Text                                    id:name           ${New_Pettype_Name}
    Click element                                 xpath://*[@id="pettype"]/div[2]/div/button

Verify added Pet Type

    ${Actual_Pettype_Name}                        Get Value     xpath://*[@id="6"]
    Should be equal                               ${Actual_Pettype_Name}    ${New_Pettype_Name}

Teardown Add New Pet Type

    Click button                                  xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[2]
    Page should not contain element               xpath://*[@id="6"]

#Gherkin Syntax for Add New Pet Type:

user is on the Pet Types page

  Go to Pet Types

a user have added a new Pet Type

  Add a new Pet Type

a user should be able to see the new Pet Type in the list

  Verify added Pet Type
  Teardown Add New Pet Type

#Add existing Pet Type - Jonna

Add existing pet

   Click button                                  xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
   Wait until page contains                      New Pet Type
   Click element                                 id:name
   Input Text                                    id:name           ${Existing_Pettype_Name}
   Click element                                 xpath://*[@id="pettype"]/div[2]/div/button

Verify added existing Pet Type

   ${Actual_New_Pettype_Name}                    Get Value     xpath://*[@id="6"]
   Should be equal                               ${Actual_New_Pettype_Name}    ${Existing_Pettype_Name}

a user has added a new Pet Type that already exists

  Add existing pet

a user should see two fields with the same Pet Type

  Verify added existing Pet Type
  Teardown Add New Pet Type

#--------------------------------------------------------------------------------------------------------------------------
#Change/Edit Pet Type

User Clicks On PetTypes
        Go To Web Page
        Sleep                                           .10
        Click Element                                    xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a

User Edit's A Pet Type

        Sleep                                            .5
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
        TearDown After Verifying

User Verifies Edited Pet Added

       Sleep                                            .2
       ${Edited_PetType_Updated}                        Get Text                               xpath://*[@id="3"]
       Should Contain                                   ${New_Edited_PetType_Name}              ${Edited_PetType_Updated}

TearDown After Verifying

        Sleep                                            .2
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${Actual_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]

User Edit's PetTypes with Same Name

        Sleep                                            .2
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[6]/td[2]/button[1]
        Input Text                                       id=name                              ${New_Edited_PetType_Name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]

User Verifies Same Pet Type Name Can Add Multiple Times

        Sleep                                            .2
        User Verifies Edited Pet Added
        ${link_text}                                    Get Value                            xpath://*[@id="5"]
        Should Not Be Equal                             ${Verify_Old_PetType_existed}        ${link_text}
        TearDown After Verifying
        TearDown Second Edited PetType After Verifying

TearDown Second Edited PetType After Verifying

        Sleep                                            .2
        Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[6]/td[2]/button[1]
        Input Text                                       id=name                              ${Second_petType_Acutal_name}
        Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]

#-------------------------------------------------------------------------------------------------------------------------
#Home Button From Veterinarians

User Clicks On Veterinarians Page

        Go To Web Page
        Sleep                                           .5
        Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/a
User Selects All Veterinarians

        Sleep                                           .2
        User Clicks On Veterinarians Page
        Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
User Is At Veterinarians Page

        Sleep                                            .2
        Page Should Contain button                       Home

User Can Go Back To Home Page

        Sleep                                           .2
        Click Element                                    xpath:/html/body/app-root/app-vet-list/div/div/div/button[1]

User Back To Home Page

      Page should Contain                                ${Welcome_Message}

User Clicks On Edit Vet

       Sleep                                            .2
       Click Element                                    xpath://*[@id="vets"]/tbody/tr[5]/td[3]/button[1]
       #Page should Contain Element                      xpath://*[@id="vet_form"]/div[5]/div/button[2]
       Page Should Not Contain Button                   Home
       Sleep                                            .2
       Click Element                                    xpath://*[@id="vet_form"]/div[5]/div/button[2]
       User Can Go Back To Home Page

User Clicks On Add New

        Sleep                                           .2
        User Clicks On Veterinarians Page
        Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
        Page Should Not Contain Button                  Home
        Sleep                                           .2
        Click Element                                   xpath://*[@id="vet"]/div[5]/div/button[1]

#-----------------------------------------------------------------------------------
#Edit pet: Isac

Go to list of owners

    Go to Web Page
    All Owners

Click on a owner

    Sleep                                           1s
    Click Element                                   xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
    ${EXPECTED_OWNER}                               Get Text    xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
    Should Be Equal                                 ${EXPECTED_OWNER}   ${CONFIGURED_OWNER}

Click edit on it's pet

    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[1]

Edit infomation on the pet

    Input Text                                      id=name     ${CONFIGURED_PET}
    ${EXPECTED_PET}                                 Get Value    id=name
    Should Be Equal                                 ${EXPECTED_PET}   ${CONFIGURED_PET}
    Press Keys                                      xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input     CTRL+A   BACKSPACE
    Input Text                                      xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input     ${CONFIGURED_DATE}
    ${EXPECTED_DATE}                                Get Value    xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input
    Should Be Equal                                 ${EXPECTED_DATE}   ${CONFIGURED_DATE}
    Click Element                                   xpath://*[@id="type"]/option[2]
    ${EXPECTED_PET2}                                Get Text    xpath://*[@id="type"]/option[2]
    Should Be Equal                                 ${EXPECTED_PET2}   ${CONFIGURED_PET2}
    Click Element                                   xpath:/html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]

Verify that all information has been edited

    Sleep                                           1s
    ${EXPECTED_PET}                                 Get Text    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
    Should Be Equal                                 ${EXPECTED_PET}     ${CONFIGURED_PET}
    ${EXPECTED_DATE}                                Get Text    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[2]
    Should Be Equal                                 ${EXPECTED_DATE}    ${CONFIGURED_DATE}
    ${EXPECTED_PET2}                                Get Text    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[3]
    Should Be Equal                                 ${EXPECTED_PET2}    ${CONFIGURED_PET2}


End Web Test

    close browser
    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Test To Remove Visit by Renu

Begin Web Test
    Open Browser            about:blank     ${BROWSER}
    Load Web
    Verify Page Loaded
    Set Selenium Speed                                .25
Load Web
    Go To                   ${URL}
Verify Page Loaded
    ${GET_TITLE}            Get Title
    Should Be Equal         ${GET_TITLE}                          SpringPetclinicAngular
    Page Should Contain     ${WELCOME_MESSAGE}                    xpath:/html/body/app-root/app-welcome/h1
User Clicks Owners
    Page Should Contain Element                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a         # Owners Tab
    Click Element                               xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
     Sleep                                         .25
All Owners
    Page Should Contain Element                //*[@routerlink="/owners"]
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-list/div/div/h2               #Owners List
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/h2
     Sleep                                         .25
    Page Should Contain Element         //*[@class="table table-striped"]
    Element Should Be Visible           //*[@class="table table-striped"]
     Sleep                                         .25
Visit is Added To The Pet
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Sleep                                         .25
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    ${VISIT_DATE}
    Input Text                          //*[@id="description"]    ${VISIT_DESCRIPTION}
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]
    Wait Until Page Contains Element    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
    Element Should Be VIsible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
     Sleep                                         .25

Delete Pet Visit
    Wait Until Page Contains Element   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Element Should Be Visible          xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Click Element                      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
     Sleep                                         .25
Verify Visit is Deleted
     Wait Until Element Is Not Visible     ${VISIT_DATE}
     Element Should Not Be Visible         ${VISIT_DATE}
     Wait Until Element Is Not Visible     ${VISIT_DESCRIPTION}
     Element Should Not Be Visible         ${VISIT_DESCRIPTION}
      Sleep                                         .25
User Selects Owner 6
    User Clicks Owners
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-list/div/div/h2               #Owners List
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/h2
     Sleep                                         .25
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
      Sleep                                         .25


Selects Pet Samantha
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/h2[2]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
      Sleep                                         .25
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[1]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[2]
    #Element Should Be Visible        ${SVISIT_DATE}
    #Element Should Be Visible        ${SVISIT_DESCRIPTION}
      Sleep                                          .25

Deletes Visit For Rabies Shot

    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
      Sleep                                          .25
Verify Visit is Deleted For Rabies Shot
    Wait Until Element Is Not Visible     ${SVISIT_DATE}
    Element Should Not Be Visible         ${SVISIT_DATE}
    Wait Until Element Is Not Visible     ${SVISIT_DESCRIPTION}
    Element Should Not Be Visible         ${SVISIT_DESCRIPTION}
     Sleep                                         .25
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    ${SVISIT_DATE}
    Input Text                          //*[@id="description"]                      ${SVISIT_DESCRIPTION}
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]

End Web Test
    Close Browser
    
    
