*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     PetclinicKeywords_main_old.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}            chrome
${URL}                http://localhost:4200
${CONFIGURED_PET}     Fido
${CONFIGURED_DATE}    2001/01/01
${CONFIGURED_PET2}    dog
${CONFIGURED_OWNER}   George Franklin
${Welcome_Message}    Welcome to Petclinic

*** Test Cases ***

Testcase 1: Test so that user can access the edit pet from a owner.
    [Documentation]             Test to access edit page
    [Tags]                      EditPage_test
    Given Go to list of owners
    When Click on a owner
    Then Click edit on it's pet

Testcase 2: Test so that user can edit the pets info and update it.
    [Documentation]             Test to edit info on pet
    [Tags]                      EditPet_test
    Given Go to list of owners
    When Click on a owner
    And Click edit on it's pet
    Then Edit infomation on the pet
    Then Verify that all information has been edited

#Testcase 1: Test so that user can access Petsclinic website.
#    [Documentation]             Test for accessing website Petclinic
#    [Tags]                      Access_test
#    Given Go to Web Page

#Testcase 2: Test so that user can access owner page.
#    [Documentation]             Test to se all owners
#    [Tags]                      OwnerPage_test
#    Given Go to list of owners
