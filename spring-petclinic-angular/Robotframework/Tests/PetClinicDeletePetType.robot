*** Settings ***
Documentation                                     Infotiv Petclinic Test Functionality
Resource                                          ../Resources/PetclinicKeywords.robot
Library                                           SeleniumLibrary
Test Setup                                        Begin WebTest
Test Teardown                                     End Web Test

*** Variables ***
${BROWSER}                                        chrome
${URL}                                            http://localhost:4200/
${Welcome_Message}                                Welcome to Petclinic
${Expected_Pettypes_Page}                         Pet Types
${New_Pettype_Name}                               bunny
*** Test Cases ***
Test PetType is deleted
    [Documentation]                               Deleting Pet Type
    [Tags]                                        Delete Pet Type
    Given Go To Pet Types
    And Add a new Pet Type
    And Verify added Pet Type
    And Select the Pet Type to delete
    And Delete the added Pet Type
    Then Verify Pet Type is deleted

Test multiple PetTypes are deleting
    [Documentation]                               Deleting Multiple Pet Types#                                 Delete Multiple Pet Types
    [Tags]                                        Delete Pet Type
    Given Go To Pet Types
    And Add a new Pet Type
    And Verify added Pet Type
    And Add a new Pet Type
    And Verify added Pet Type
    And Delete multiple Pet Types
    Then Verify multiple Pet Types are deleted

