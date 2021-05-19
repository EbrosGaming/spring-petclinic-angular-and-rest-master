*** Settings ***
Documentation        Test to Delete Visit for a Pet
Resource             ../Resources/PetclinicKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin WebTest
Test Teardown        End Web Test
*** Variables ***
${BROWSER}                   headlesschrome
${URL}                       http://localhost:4200
${WELCOME_MESSAGE}           Welcome to Petclinic
${VISIT_DATE}                2021/05/07
${VISIT_DESCRIPTION}         Checkup
${SVISIT_DATE}               2013/01/01
${SVISIT_DESCRIPTION}        rabies shot

*** Test Cases ***
Delete Visit For a Pet
    [Documentation]     Delete Visit
    [Tags]              Delete Pet Visit
    Given User Selects a Pet and Owner
    When User Selects Visit For The Pet
    And Deletes Pet Visit
    Then Verify Visit is Deleted
Delete Pet Visit For Specific Owner and Specific Pet From Visits List
    [Documentation]     Delete Visit For Specific Owner and Specific Pet From Visits List
    [Tags]              Delete Specific Visit
    Given User Selects Owner 6
    And Selects Visit For Pet Samantha
    And Deletes Visit For Rabies Shot
    Then Verify Visit is Deleted For Rabies Shot
