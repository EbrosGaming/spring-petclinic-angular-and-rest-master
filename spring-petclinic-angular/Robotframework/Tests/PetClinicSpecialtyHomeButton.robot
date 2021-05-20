*** Settings ***
Documentation        Home Button On Specialty Page
Resource             ../Resources/PetclinicKeywords.robot
Library              SeleniumLibrary
Test Setup           Begin WebTest
Test Teardown        End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          http://localhost:4200
${Welcome_Message}              Welcome to Petclinic
${Expected_Specialties_Page}    Specialties
*** Test Cases ***
Test If Home Button Works On Specialties Page
    [Documentation]     Check If Home Button is Available and Working on Specialties Page
    [Tags]              Click Home Button On Specialties page
    Given User Is On Specialties Page
    When Clicks on Home Button
    Then Comes back to the Home Page
*** Test Cases ***
Test If Home Button Works On Edit Specialties Page
    [Documentation]     Check If Home Button is Available and Working on Edit Specialties Page
    [Tags]              Click Home Button On Edit Specialities page
    Given User Is On Edit Specialties Page
    When Clicks on Home Button
    Then Comes back to the Home Page