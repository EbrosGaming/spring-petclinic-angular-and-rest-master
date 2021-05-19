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
${Welcome_Message}           Welcome to Petclinic
*** Test Cases ***
Test If Home Button Works On Specialties Page
    [Documentation]     Check If Home Button is Available and Working on Specialties Page
    [Tags]              Click Home Button On Specialties page should contain element
    Given User Is On Specialties Page
    When Clicks on Home Button
    Then Comes back to the Home Page
*** Test Cases ***
Test If Home Button Works On Edit Specialties Page
    [Documentation]     Check If Home Button is Available and Working on Edit Specialties Page
    [Tags]              Click Home Button On Edit Specialities page should contain element
    Given User Is On Edit Specialties Page
    When Clicks on Home Button
    Then Comes back to the Home Page
