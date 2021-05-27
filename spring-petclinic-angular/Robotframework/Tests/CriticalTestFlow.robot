*** Settings ***
Documentation                               Infotiv Petclinic critical Flow Test
Resource                                    ../Resources/CriticalFlowKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test
*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic
${Add_Owner_page}                           New Owner
${Firstname}                                ABC
${Lastname}                                 DEF
${Owner_fullname}                           ABC DEF
${Adress}                                   DisneyLand
${City}                                     LasAngeles
${Mobile}                                   123456789
${New_ownerPage}                            New Owner
${Owners_List_Page}                         Owners
${Add_PetPage}                              Add Pet
${New_PetName}                              Venus
${NewPet_BirthDate}                         2021/05/19
${Verify_pet_1_Added}                       Venus
${Owner_Information_Page}                   Owner Information
${Visit_Date}                               2021/05/26
${Visit_Description}                        Vaccination
*** Test Cases ***
Test To AddOwner->AddAPet->AddVisit
  [Documentation]                          Testing with add owner,add pet and add visit
  [Tags]                                   Critical flow test
  Given User Adds An Owner
  When User Adds A Pet To The Owner
  And Adds A Visit To The Newly Added pet
  Then A New Owner Created,Added a Pet And Added A Visit To The Pet

*** Keywords ***
Test Navigates to chrome Home Page
Begin WebTest
    OPEN BROWSER                                     about:blank                         ${BROWSER}
Go To Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                            ${URL}
Verify Page Loaded
    ${actualTerm}                                     get text                          xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   ${Welcome_Message}                ${actualTerm}
#Add Owner
User Adds An Owner
    Go To Web Page
    Click Element                                  xpath://a[contains(text(),'Owners')]
    wait until page contains                       Owners
    Click Element                                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                       ${New_ownerPage}
    Input Text                                     id=firstName                           ${Firstname}
    Input Text                                     id=lastName                            ${Lastname}
    Input Text                                     id=address                             ${Adress}
    Input Text                                     id=city                                ${City}
    Input Text                                     id=telephone                           ${Mobile}
    Click Element                                  xpath://div/button[contains(string(), "Add Owner")]
    wait until page contains                      ${Owners_List_Page}
    wait until page contains Element              xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a
    page should contain Element                   xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a
#Add Pet
User Adds A Pet To The Owner
    wait until page contains                      ${Owner_fullname}
    Click Element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a
    Click Element                                 xpath:/html/body/app-root/app-owner-detail/div/div/button[3]
    Input New Pet Detalis
    Pet Details                                   ${New_PetName}               ${NewPet_BirthDate}
    Wait until page contains                      ${Owner_Information_Page}
    ${pet_added}                                  get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
    Should Contain                                ${Verify_pet_1_Added}                ${pet_added}
Input New Pet Detalis
    Wait until page contains                      ${Add_PetPage}
    Click Element                                 id=name
Pet Details
    [Arguments]                                   ${Pet_Name}                          ${Birth_Date}
    Name                                          ${Pet_Name}
    Birth Date                                    ${Birth_Date}
    Click Element                                 id=type
    Click Element                                 xpath://*[@id="type"]/option[2]
    Click Element                                 xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
    Wait until page contains                      ${Owner_Information_Page}
Name
    [Arguments]                                   ${Pet_Name}
    Input Text                                    id=name                             ${Pet_Name}
Birth Date
    [Arguments]                                   ${Birth_Date}
    Input Text                                    xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input          ${Birth_Date}
#Add Visit
Adds A Visit To The Newly Added pet
    Wait until page contains                      ${New_PetName}
    Click Element                                 Xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Input Text                                    Xpath://*[@id="visit"]/div[1]/div[1]/div/input        ${Visit_Date}
    Input Text                                    Xpath://*[@id="description"]                          ${Visit_Description}
    Click Element                                 xpath://*[@id="visit"]/div[2]/div/button[2]
    Wait until page contains                      ${Visit_Description}
    Page Should Contain Element                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[2]
Teardown
    Click Element                                 xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Click Element                                 xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[2]
A New Owner Created,Added a Pet And Added A Visit To The Pet
    Page Should Contain                            ${Owner_fullname}
    Page Should Contain                            ${New_PetName}
    Page Should Contain                            ${Visit_Description}
    Teardown
End Web Test
    Close Browser
