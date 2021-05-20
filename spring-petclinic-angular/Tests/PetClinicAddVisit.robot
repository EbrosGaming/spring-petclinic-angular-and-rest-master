*** Settings ***
Documentation        Test to Add Visit for a Pet
Resource             ../Resources/PetclinicKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin WebTest
Test Teardown        End Web Test
*** Variables ***
${BROWSER}                   chrome
${URL}                       http://localhost:4200
${WELCOME_MESSAGE}           Welcome to Petclinic
${VISIT_DATE1}                2021/05/07
${VISIT_DESCRIPTION1}         Checkup
${VISIT_DATE2}               2021/05/09
${VISIT_DESCRIPTION2}        Dental CheckUp


*** Test Cases ***
Add a pet visit
   [Documentation]                               Add a petvisit and verifying
   [Tags]                                        Add a pet visit
    Given User Selects an Owner
    And Adds visit for a pet
    Then Verify visit is added to a pet

Add Multiple petvisits to one pet
   [Documentation]                               Add Multiple petvisits and verifying
   [Tags]                                        Add Multiple petvisits to one pet
    Given User Selects an Owner
    And Adds Visits for a pet
    Then Verify multiple pet visits are added