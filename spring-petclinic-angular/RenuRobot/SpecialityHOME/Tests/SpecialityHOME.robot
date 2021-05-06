*** Settings ***
Documentation        Test to Add, Edit & Delete Visit for a Pet
...                  Test to check all Actions for Visits of a Pet
Resource             ../Resources/SpecialityHOMEKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin Web Tests
Test Teardown        End Web Tests
*** Variables ***
${BROWSER}                   chrome
${URL}                       http://localhost:4200
${WELCOME_MESSAGE}           Welcome to Petclinic
*** Test Cases ***
Test If Home Button Works On Speciality Page
    [Documentation]     Check If Home Button is Available and Working on Speciality Page
    [Tags]              Click Home Button On Speciality page should contain element
    Given User Is On Speciality Page
    When Clicks on Home Button
    Then Comes back to the Home Page
*** Test Cases ***
Test If Home Button Works On Edit Speciality Page
    [Documentation]     Check If Home Button is Available and Working on Edit Speciality Page
    [Tags]              Click Home Button On Edit Speciality page should contain element
    Given User Is On Edit Speciality Page
    #When Clicks on Home Button
    Then Comes back to the Home Page

