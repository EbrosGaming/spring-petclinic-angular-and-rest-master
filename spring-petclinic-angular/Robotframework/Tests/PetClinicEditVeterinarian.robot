*** Settings ***
Documentation                          Infotiv Petclinic Test Functionality
Resource                               ../Resources/PetclinicKeywords.robot
Library                                SeleniumLibrary
Test Setup                             Begin WebTest
Test Teardown                          End WebTest

*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     Welcome to Petclinic
${New_Vet_Firstname}                   Arun Kumar
${New_Vet_Lastname}                    Chilkury
${Vet_Type}                            radiology
${Edited_Vet_Firstname}                Arun Kumar Rao

*** Test Cases ***
Test Edit veterinarian
    [Documentation]                     Edit veterinarian
    [Tags]                              Edit veterinarian
    Given Go To Web Page
    When Going to Veterinarians page
    And Add New Veterinarian
    And Select the Veterinarian to Edit
    And Edit added veterinarian
    And Verify veterinarian edited
    Then Teardown after veterinarian added and edited
Test Able to edit multiple veterinarians
    [Documentation]                     Edit multiple veterinarians
    [Tags]                              Edit multiple veterinarians
    Given Go To Web Page
    When Going to Veterinarians page
    And Edit multiple veterinarians
    And Verify multiple Veterinarians edited
    Then Teardown after multiple Veterinarians added and edited
