*** Settings ***
Documentation        Test to Add, Edit & Delete Visit for a Pet
...                  Test to check all Actions for Visits of a Pet
Resource             ../Resources/PetclinicKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin WebTest
Test Teardown        End Web Test
*** Variables ***
${BROWSER}                   chrome
${URL}                       http://localhost:4200
${WELCOME_MESSAGE}           Welcome to Petclinic
${VISIT_DATE}                2021/05/07
${VISIT_DESCRIPTION}         checkup
${SVISIT_DATE}               2013/01/01
${SVISIT_DESCRIPTION}        rabies shot
*** Test Cases ***
Remove Pet Visit
    [Documentation]     Delete Visit For a Pet
    [Tags]              Delete Pet Visit
    Given User Clicks Owners
    When Clicks All Owners
    And Visit is Added To The Pet
    And Deletes Pet Visit
    Then Verify Visit is Deleted
Remove Visit For Specific Owner and Specific Pet From Visits List
    [Documentation]     Delete Pet Visit For Specific Owner and Specific Pet From Visits List
    [Tags]              Delete Pet Visit
    Given User Selects Owner 6
    When Selects Pet Samantha
    And Deletes Visit For Rabies Shot
    Then Verify Visit is Deleted For Rabies Shot
