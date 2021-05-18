*** Settings ***
Documentation        Test to Add, Edit & Delete Visit for a Pet
...                  Test to check all Actions for Visits of a Pet
Resource             PetclinicKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin WebTest
Test Teardown        End Web Test
*** Variables ***
${BROWSER}                   chrome
${URL}                       http://localhost:4200
${Welcome_Message}           Welcome to Petclinic
*** Test Cases ***
Test If Home Button Works On Specialities Page
    [Documentation]     Check If Home Button is Available and Working on Specialities Page
    [Tags]              Click Home Button On Specialities page should contain element
    Given User Is On Specialities Page
    When Clicks on Home Button
    Then Comes back to the Home Page
*** Test Cases ***
Test If Home Button Works On Edit Specialities Page
    [Documentation]     Check If Home Button is Available and Working on Edit Specialities Page
    [Tags]              Click Home Button On Edit Specialities page should contain element
    Given User Is On Edit Specialities Page
    When Clicks on Home Button
    Then Comes back to the Home Page

