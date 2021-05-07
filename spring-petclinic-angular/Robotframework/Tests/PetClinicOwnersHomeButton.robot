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
    Check if button exist

Test you can click on Home button from and page under Owners
    [Documentation]                    Click on Home button from Owners page
    [Tags]                             Home button

    Given user is on Owners page
    Click an owner
    Check if button exist


