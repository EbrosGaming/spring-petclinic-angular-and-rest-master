*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic

*** Test Cases ***
Test For User Comes Back To Home Page
  [Documentation]                          User Comes Back To Home Page From Veterinarians
  [Tags]                                   Back To Home From Veternians
    Given User Selects All Veterinarians
    When User Is At Veterinarians Page
    And User Can Go Back To Home Page
    Then User Back To Home Page

*** Test Cases ***
Test Back To Home Page From EditVet
  [Documentation]                          User Comes Back To Home Page From Edit Vet Page
  [Tags]                                   Back To Home From Edit Vet Page
   Given User Selects All Veterinarians
   When User Is At Veterinarians Page
   And User Clicks On Edit Vet
   Then User Back To Home Page

*** Test Cases ***
Test Back To Home Page From AddVet
  [Documentation]                          User Comes Back To Home Page From Add New Page
  [Tags]                                   Back To Home From AddNew Page
   Given User Clicks On Add New
   When User Is At Veterinarians Page
   And User Can Go Back To Home Page
   Then User Back To Home Page






