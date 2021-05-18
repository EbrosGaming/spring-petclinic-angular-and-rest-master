*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     PetclinicKeywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}            chrome
${URL}                http://localhost:4200
${Welcome_Message}    Welcome to Petclinic
${FIRST_NAME}         Alfred
${LAST_NAME}          Olofsson
${FULL_NAME}          Alfred Olofsson
${SPECIALTIES}        surgery

*** Test Cases ***

Testcase 1: Test so user can go to add new vet page.

    [Documentation]             Test to access add vet page
    [Tags]                      AddVetPage_test
    Given Go to vet add page
    When Click on add vet

Testcase 2: Test so user can add a new vet.

    [Documentation]             Test to add a new vet
    [Tags]                      AddNewVet_test
    Given Go to vet add page
    When Click on add vet
    Then Add a new vet
    And Verify that vet has been added
    And Delete newly added vet
