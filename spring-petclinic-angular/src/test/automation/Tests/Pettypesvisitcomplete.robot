*** Settings ***
Documentation                              This is some basic  info about the whole test suite
Resource                                   ../Resources/PetKeywords.robot
Library                                    SeleniumLibrary
Test Setup                                 Begin Web Test
Test Teardown                              End Web Test

*** Variables ***

${BROWSER}                                 chrome
${URL}                                     http://localhost:4200/
${Welcome_Message}                         Welcome to Petclinic
${Pet_Visit_Date_1}                        2021/05/11
${Pet_Visit_Description_1}                 Dental
${Row_Path1}                               xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr
${Pet_Visit_Date_2}                        2021/05/09
${Pet_Visit_Date_3}                        2021/05/15
${Pet_Visit_Description_2}                 Body Checkup
${Pet_Visit_Description_3}                 Overall Health Checkup

*** Test Cases ***
Adding a pet visit
   [Documentation]                         Adding a petvisit and verifying
   [Tags]                                  Testing adding a petvisit and verifying
   Given Go To Web Page
   When All Owners
   And Select A Owner From The List
   And AddVisit Button or Add Pet visit in the owners info page
   And Pet Visit Details                   ${Pet_Visit_Date_1}               ${Pet_Visit_Description_1}
   And Verify Visit Added To A Pet
   Then Teardown Add Pet Visit


Add multiple petvisits to one pet
    [Documentation]                         Adding Multiple petvisits and verifying
    [Tags]                                  Testing adding Multiple Petvisits and verifying
    Given Go To Web Page
    When All Owners
    And Select A Owner From The List
    And AddVisit Button or Add Pet visit in the owners info page
    And Pet Visit Details                        ${Pet_Visit_Date_2}               ${Pet_Visit_Description_2}
    And AddVisit Button or Add Pet visit in the owners info page
    And Pet Visit Details                        ${Pet_Visit_Date_3}               ${Pet_Visit_Description_3}
    And Verify able to add multiple pet visits
    Then Teardown Add Multiple Pet Visits 1

*** Keywords ***
Begin WebTest
     OPEN BROWSER                             about:blank                         chrome
     Maximize Browser Window
     Set Selenium Speed                       .5
Go To Web Page
      Load Page
      Verify Page Loaded
Load Page
      Go to                                   ${URL}
Verify Page Loaded
     ${actualTerm}                            get text                          xpath:/html/body/app-root/app-welcome/h1
     Should Be Equal                          ${Welcome_Message}                ${actualTerm}
All Owners
     Click Element                            xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
     Click Element                            xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
Select A Owner From The List
     Set Selenium speed                       .25
     Click Element                            xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Set Selenium speed                       .25
     Wait Until Page Contains                 Betty Davis
AddVisit Button or Add Pet visit in the owners info page
     Click Button                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
     Wait Until Page Contains                 New Visit

Pet Visit Details
     [Arguments]                              ${Pet_Visit_Date}        ${Pet_Visit_Description}
     Visit Date                               ${Pet_VisitDate}
     Description                              ${PetVisit_Description}
     Set Selenium Speed                       .5
Visit Date
     [Arguments]                              ${Pet_VisitDate}
     Input Text                               xpath://*[@id="visit"]/div[1]/div[1]/div/input       ${Pet_VisitDate}
Description
     [Arguments]                              ${PetVisit_Description}
     Input Text                               xpath://*[@id="description"]     ${PetVisit_Description}
#Click on Add Visit Button
     Click Button                             xpath://*[@id="visit"]/div[2]/div/button[2]
                                                   # //*[@id="visit"]/div[2]/div/button[2]
Verify Visit Added To A Pet
      Sleep                                   0.5 s
      ${Verify_Pet_Visit_Date_Added}          get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[1]

      ${Verify_Pet_Visit_Description_Added}   get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[2]
      Sleep                                   0.5 s
      Table should contain                    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table     ${Verify_Pet_Visit_Date_Added}  ${Verify_Pet_Visit_Description_Added}

#Row path1       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr
Teardown Add Pet Visit
      Click button                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
      Sleep                                    0.1 s
#Take path of complete row or visit date added
      Page should not contain element          ${Row_Path1}

Verify able to add multiple pet visits
     # Sleep                                         0.5 s
      ${Verify_Pet_Visit_Date2_Added}          get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[1]
      ${Verify_Pet_Visit_Description2_Added}   get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[2]
      ${Verify_Pet_Visit_Date3_Added}          get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[1]/td[1]
      ${Verify_Pet_Visit_Description3_Added}   get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[1]/td[2]
      Table should contain                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table      ${Verify_Pet_Visit_Date2_Added} ${Verify_Pet_Visit_Description2_Added}
      Table should contain                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table      ${Verify_Pet_Visit_Date3_Added} ${Verify_Pet_Visit_Description3_Added}
      #${VerifyRow_Path2}                            get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[1]
      #${VerifyRow_Path3}                            get text        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[2]
      #Table should contain                          xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table      ${VerifyRow_Path2}  ${VerifyRow_Path3}

Teardown Add Multiple Pet Visits 1
      Click button                              xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
      Click button                              xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
      Page should not contain element           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[1]/td[1]
      Page should not contain element           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[2]/td[1]
#     Page should not contain element               ${VerifyRow_Path2}
#     Page should not contain element               ${VerifyRow_Path3}


