*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    ../Resources/PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic
${Actual_PetType_Name}                      snake
${Second_petType_Acutal_name}               hamster
${New_Edited_PetType_Name}                  rabbit
${Verify_Old_PetType_existed}               hamster



*** Test Cases ***
Editing A Pet Type
  [Documentation]                          Testing Editing Pet type and verifying
  [Tags]                                   Editing A Pet Type
    Given User Clicks On PetTypes
    When User Edit's A Pet Type
    Then User Verifies Edited Pet Added

*** Test Cases ***
Editing Same Pet Type Name
  [Documentation]                          Testing Editing Same Name to Diffrent Pet Types
  [Tags]                                   Same PetType name For Multiles Times
    Given User Clicks On PetTypes
    When User Edit's PetTypes with Same Name
    Then User Verifies Same Pet Type Name Can Add Multiple Times

