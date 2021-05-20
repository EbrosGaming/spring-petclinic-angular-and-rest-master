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
${New_Vet_Firstname}                        Arun Kumar
${New_Vet_Lastname}                         Chilkury
${Vet_Type}                                 radiology
${Edited_Vet_Firstname}                     Arun Kumar Rao
${Edited_Vet_Lastname}                      Chilkury
${Edit_Veterinarian_Page}                   Edit Veterinarian
${Veterinarian_Page}                        Veterinarians
${LastName_Required_Message}                Last name is required
${Original_Owner_FirstName}                 James
${Original_Owner_LastName}                  Careter

*** Test Cases ***
Edit Already Existed Veterinarian
    [Documentation]                               Editing Existed Veterinarian
    [Tags]                                        Edit Veterinarian
    Given An User Is On Veterinarians Page
    When User Selects A Veterinarian To Edit
    Then Veterinarian Details Changed On the List
    
Edit Newly Added Veterinarian
    [Documentation]                               Editing Nely Added Veterinarian
    [Tags]                                        Edit Veterinarian
    Given An User Is On Veterinarians Page
    When User Adds A Veterinarian And Edits Same Veterinarian
    Then Newly Added Vet Edited

Edit Veterinarian With Empty Field
    [Documentation]                               Editing With Empty Field
    [Tags]                                        Edit Veterinarian
    Given An User Is On Veterinarians Page
    When User Selects A Veterinarian And Edits With Empty Field
    Then User Should See An Erorr Message




