*** Settings ***
Documentation                          Infotiv Petclinic Test Functionality
Resource                               ../Resources/PetclinicKeywords.robot
Library                                SeleniumLibrary
Test Setup                             Begin WebTest
Test Teardown                          End Web Test

*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     Welcome to Petclinic
${Expected_Specialties_Page}           Specialties
${New_Specialty_Name}                  Opthalmology
${Existing_Specialty_Name}             Get Value     xpath://*[@id="0"]

*** Test Cases ***

Test add a new Specialty
    [Documentation]                    Adding a new Specialty
    [Tags]                             Add Specialty
    Given user is on the Specialties page
    When a user have added a new Specialty
    Then a user should be able to see the new Specialty in the list

Test adding an existing Specialty
    [Documentation]                    Adding a new Specialty
    [Tags]                             Add Specialty
    Given user is on the Specialties page
    When a user has added a new Specialty that already exists
    Then a user should see two fields with the same Specialty


