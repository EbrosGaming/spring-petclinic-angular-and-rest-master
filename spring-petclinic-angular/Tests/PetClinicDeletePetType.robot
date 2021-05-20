*** Settings ***
Documentation                               Infotiv Petclinic Performance Test
Resource                                    ../Resources/PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic
${Expected_Pettypes_Page}                   Pet Types
${New_Pettype_Name}                         bunny
${Deleted_PetType}                          hamster
*** Test Cases ***
Delete Already Existed Pet Type
    [Documentation]                               Deleting Existed PetType
    [Tags]                                        Delete PetType
    Given An User Is On PetType Page
    When User Deletes Already Existed PetType
    Then PetType Deleted From The List

Delete Nely Added Pet Type
    [Documentation]                               Deleting Newly Added PetType
    [Tags]                                        Delete PetType
    Given An User Is On PetType Page
    When User Deletes Newly Added PetType
    Then Added PetType Is Deleted From The List