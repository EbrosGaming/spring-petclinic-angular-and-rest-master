*** Settings ***
Documentation        Test to Add, Edit & Delete Visit for a Pet
...                  Test to check all Actions for Visits of a Pet
Resource             ../Resources/PCPetVisitsKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin Web Tests
Test Teardown        End Web Tests
*** Variables ***
${BROWSER}                   chrome
${URL}                       http://localhost:4200
${VISIT_DATE}                2021/05/07
${VISIT_DESCRIPTION}         checkup

*** Test Cases ***
Remove Pet Visit
    [Documentation]     Delete Pet Visit
    [Tags]              Delete Pet Visit
    Given Go To Web Page
    And Click Owners
    And All Owners
    And Visit is Added To The Pet
    And Delete Pet Visit
    And Verify Visit is Deleted
    Then Close Browser