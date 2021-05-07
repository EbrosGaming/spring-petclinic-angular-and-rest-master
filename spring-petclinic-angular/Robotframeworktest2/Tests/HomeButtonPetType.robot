*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    ../Resources/keywords2.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  headless chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic


*** Test Cases ***
Editing A Pet Type
  [Documentation]                          Home
  [Tags]                                   Landing page

    Given user is on landing page
    When user enters pet types
    And click on the home button
    Then the user should return to the landing page
