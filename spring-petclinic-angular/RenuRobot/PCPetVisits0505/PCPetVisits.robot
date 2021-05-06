*** Settings ***
Documentation        Test to Add, Edit & Delete Visit for a Pet
...                  Test to check all Actions for Visits of a Pet
Resource             ../Resources/PCPetVisitsKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin Web Tests
Test Teardown        End Web Tests
*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200

*** Test Cases ***
Add Pet Visit
    [Documentation]     Add Pet Visit
    [Tags]              Add Pet Visit
    Given Go To Web Page
    And Click Owners
    And All Owners
    And Create Pet Visit
    Then Close Browser
*** Test Cases ***
Edit Pet Visit
    [Documentation]      Edit Pet Visit
    [Tags]               Edit Pet Visit
    Given Go To Web Page
    And Click Owners
    And All Owners
    And Edit Pet Visit
    Then Close Browser
*** Test Cases ***
Delete Pet Visit
    [Documentation]     Delete Pet Visit
    [Tags]              Delete Pet Visit
    Given Go To Webpage
    And Click Owners
    And All Owners
    And Delete Pet Visit
    Then Close Browser