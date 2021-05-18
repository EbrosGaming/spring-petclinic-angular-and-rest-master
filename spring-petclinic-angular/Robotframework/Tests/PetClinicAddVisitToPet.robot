*** Settings ***
Documentation                                  This is some basic  info about the whole test suite
Resource                                       PetclinicKeywords.robot
Library                                        SeleniumLibrary
Test Setup                                     Begin Web Test
Test Teardown                                  End Web Test
*** Variables ***

${BROWSER}                                      chrome
${URL}                                          http://localhost:4200/
${Welcome_Message}                              Welcome to Petclinic
#change
${Pet_Visit_Date_1}                              2021/05/11
#change
${Pet_Visit_Description_1}                       Dental
${Row_Path1}                                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr
#Multiple
${Pet_Visit_Date_2}                              2021/05/09
${Pet_Visit_Date_3}                              2021/05/15
${Pet_Visit_Description_2}                       Body Checkup
${Pet_Visit_Description_3}                       Overall Health Checkup

*** Test Cases ***
Adding a pet visit
   [Documentation]                               Adding a petvisit and verifying
   [Tags]                                        Adding a pet visit
   Given User selects an owner
   And Click Add Visit button
   And Pet Visit details                         ${Pet_Visit_Date_1}               ${Pet_Visit_Description_1}
   And Verify visit added to a pet
   Then Teardown added pet visit
Add multiple petvisits to one pet
   [Documentation]                               Adding Multiple petvisits and verifying
   [Tags]                                        Add multiple petvisits to one pet
    Given User selects an owner
    And Click Add Visit button
    And Pet Visit details                        ${Pet_Visit_Date_2}               ${Pet_Visit_Description_2}
    And Click Add Visit button
    And Pet Visit details                        ${Pet_Visit_Date_3}               ${Pet_Visit_Description_3}
    Verify able to add multiple pet visits
    Then Teardown added multiple visits
