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

*** Test Cases ***
Test For User Comes Back To Home Page
  [Documentation]                          User Comes Back To Home Page From PetTypes
  [Tags]                                   Back To Home From Pet Types
    Given User Clicks On PetTypes
    When User Is At PetTypes Page
    And User Can Go Back To Home Page
    Then User Back To Home Page

*** Test Cases ***
Test Back To Home Page From Edit
  [Documentation]                          User Comes Back To Home Page From Edit PetTypes Page
  [Tags]                                   Back To Home From Edit Pet Types Page
    Given User Clicks On PetTypes
    When User Clicks A Pet Type Edit
    Then User Back To Home Page


