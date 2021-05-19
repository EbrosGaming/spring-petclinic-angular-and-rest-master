  
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
${Existing_Specialty_Name}             radiology
*** Test Cases ***
Test add a new Specialty
    [Documentation]                    Testing if a new Specialty is Added
    [Tags]                             New Specialty should be added
    Given user is on the Specialties Page
    When a user has added a new Specialty
    Then a user should be able to see the new Specialty in the list
Test adding an existing Specialty
    [Documentation]                    Testing if an existing Specialty can be added again
    [Tags]                             Existing Specialty should be added
    Given user is on the Specialties Page
    When a user has added a new Specialty that already exists
    Then a user should see two fields with the same Specialty
