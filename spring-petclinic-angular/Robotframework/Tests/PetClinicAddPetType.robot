*** Settings ***
Documentation                          Infotiv Petclinic Test Functionality
Resource                               ../Resources/PetclinicKeywords.robot
Library                                SeleniumLibrary
Test Setup                             Begin WebTest
Test Teardown                          End Web Test

*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     Welcome to Petclinic
${Expected_Pettypes_Page}              Pet Types
${New_Pettype_Name}                    bunny

*** Test Cases ***

Test add a new Pet Type
    [Documentation]                    Adding a new Pet Type
    [Tags]                             Add  Pet Type

    Given user is on the Pet Types page
    When a user have added a new Pet Type
    Then a user should be able to see the new Pet Type in the list

Test adding an existing Pet Type
    [Documentation]                    Adding a new Pet Type
    [Tags]                             Add  Pet Type

    Given user is on the Pet Types page
    When a user has added a new Pet Type that already exists
    Then a user should see two fields with the same Pet Type


