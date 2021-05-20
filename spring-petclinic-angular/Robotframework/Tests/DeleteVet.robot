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
${Expected_Vets_Page}                  Veterinarians
${Reset_Firstname}                     Sharon
${Reset_Lastname}                      Jenkins


*** Test Cases ***

Test Delete Vet
    [Documentation]                    Deleting vet
    [Tags]                             Delete  Vet  Veterinarians
    Given user is on the Veterinarian Page
    When user clicks on delete vet
    Then the deleted vet should no longer exist