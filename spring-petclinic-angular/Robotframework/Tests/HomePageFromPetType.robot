*** Settings ***
Documentation                                  This is some basic  info about the whole test suite
Resource                                       ../Resources/PetclinicKeywords.robot
Library                                        SeleniumLibrary
Test Setup                                     Begin Web Test
Test Teardown                                  End Web Test
*** Variables ***

${BROWSER}                                      chrome
${URL}                                          http://localhost:4200/
${Welcome_Message}                              Welcome to Petclinic


*** Test Cases ***
Get back to homepage from pet type
   [Documentation]                               Get back to homepage from pettype
   [Tags]                                        Back to homepage

   Given user is on landing page
   When user enters pet types
   And click on the home button
   Then the user should return to the landing page

#__________________________________________________________


