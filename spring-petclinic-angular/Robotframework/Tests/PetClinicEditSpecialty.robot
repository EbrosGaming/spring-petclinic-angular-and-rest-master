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
${Expected_Specialties_Page}                Specialties
${Actual_Specialty_Name}                      radiology
${Second_Specialty_Acutal_name}               surgery
${New_Edited_Specialty_Name}                  cardiology
${Verify_Old_Specialty_existed}               surgery
*** Test Cases ***
Editing A Specialty
  [Documentation]                          Testing Editing Specialty and verifying
  [Tags]                                   Editing A Specialty
    Given user is on the Specialties page
    When user edits A Specialty Name
    Then user Verifies Specialty Is Updated
*** Test Cases ***
Editing Same Specialty Name Multiple Times
  [Documentation]                          Testing Editing Same Name to Multiple Specialties
  [Tags]                                   Same Specialty Name For Multiles Times
    Given user is on the Specialties page
    When user edits Specialties Names with Same Name
    Then user Verifies Same Specialty Name Can Be Added Multiple Times