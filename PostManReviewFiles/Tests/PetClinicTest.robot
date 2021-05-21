*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    ../Resources/PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/

*** Test Cases ***
Adding a new pet to petclinic website
<<<<<<< HEAD
  [Documentation]                           Testing adding a newpet and verifying
  [Tags]                                    Test case-1
  Given Go To Web Page
  When All Owners
  And Select a owner and Add New Pet
=======
  [Documentation]                          Testing adding a newpet and verifying
  [Tags]                                   Testing adding a newpet and verifying
  Given Go To Web Page
  When Owners
  And Add New Pet
>>>>>>> 947c09e (Added files for Jira task ids PC24,PC57,PC38 and PC63)
  And Input New Pet Detalis
  And Pet Details                             Tommy                 2021/04/19
  Then Verify Pet Adedd To owner
*** Test Cases ***
Editing A pet in petclinic website
<<<<<<< HEAD
  [Documentation]                             Testing Edit A Pet With New Name And Verifying
  [Tags]                                      Test case-2
  Given Go To Web Page
  When All Owners
  And Edit a Pet
=======
  [Documentation]                          Testing Edit A Pet With New Name And Verifying
  [Tags]                                   Testing Edit A Pet With New Name And Verifying
  Given Go To Web Page
  And Owners
  When Edit a Pet
>>>>>>> 947c09e (Added files for Jira task ids PC24,PC57,PC38 and PC63)
  Then Give a New Pet name                      Storm








