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
${Home_Button}                         Home

*** Test Cases ***

Test you can click on Home button from Owners page
    [Documentation]                    Click on Home button from Owners page
    [Tags]                             Home button

    Given user is on Owners page
    When user clicks on Home button
    #Then user should be back on Home Page              Activate when Home button exists

Test you can click on Home button from any page under Owners
    [Documentation]                    Click on Home button from subpages to Owners page
    [Tags]                             Home button

    Given user is on Owners page
    When user clicks on a user and clicks the Home button
    #Then user should be back on Home Page              Activate when Home button exists


