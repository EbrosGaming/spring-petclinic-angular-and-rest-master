*** Settings ***
Documentation                          Infotiv Petclinic Test Functionality
#Resource                               ../Resources/PetclinicKeywords.robot
Library                                SeleniumLibrary
Test Setup                             Begin WebTest
Test Teardown                          End Web Test

*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     Welcome to Petclinic
${Expected_Specialties_Page}           Specialties
${New_Specialty_Name}                  Opthalmology
${Existing_Specialty_Name}             Get Value     xpath://*[@id="0"]

*** Test Cases ***

Test add a new Specialty
    [Documentation]                    Adding a new Specialty
    [Tags]                             Add Specialty
    Given user is on the Specialties page
    When a user have added a new Specialty
    Then a user should be able to see the new Specialty in the list

Test adding an existing Specialty
    [Documentation]                    Adding a new Specialty
    [Tags]                             Add Specialty
    Given user is on the Specialties page
    When a user has added a new Specialty that already exists
    Then a user should see two fields with the same Specialty

*** Keywords ***
Begin WebTest
    OPEN BROWSER                                       about:blank                         ${BROWSER}
    #Maximize Browser Window

Go To Web Page
     Load Page
     Verify Page Loaded

Load Page
     Go to                                            ${URL}

Verify Page Loaded
    ${actualTerm}                                     get text                          xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   ${Welcome_Message}                ${actualTerm}

user is on the Specialties page
    Go to Specialties

Go to Specialties
    Go To Web Page
    Click element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[5]/a/span[2]
    Verify on the right page

Verify on the right page
    ${Actual_Specialties_Page}                       Get Text    xpath:/html/body/app-root/app-specialty-list/div/div/h2
    Should be equal                                  ${Actual_Specialties_Page}   ${Expected_Specialties_Page}

a user have added a new Specialty
    Add a new Specialty

a user should be able to see the new Specialty in the list
    Verify added Specialty
    Teardown Add a New Specialty

Add a new Specialty
    Click button                                  xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]
    Wait until page contains                      New Specialty
    Click element                                 id:name
    Input Text                                    id:name           ${New_Specialty_Name}
    Click element                                 xpath://*[@id="specialty"]/div[2]/div/button

Verify added Specialty
    ${Actual_Specialty_Name}                      Get Value     xpath://*[@id="3"]
    Should be equal                               ${Actual_Specialty_Name}    ${New_Specialty_Name}

Teardown Add a New Specialty
    Click button                                  xpath://*[@id="specialties"]/tbody/tr[4]/td[2]/button[2]
    Wait until page contains                      Specialties
    Page should not contain element               xpath://*[@id="3"]

a user has added a new Specialty that already exists
    Add existing Specialty

Add existing Specialty
    Click button                                  xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]
    Wait until page contains                      New Specialty
    Click element                                 id:name
    Input Text                                    id:name           ${Existing_Specialty_Name}
    Click element                                 xpath://*[@id="specialty"]/div[2]/div/button

a user should see two fields with the same Specialty
  Verify added existing Specialty
  Teardown Add a New Specialty

Verify added existing Specialty
    ${Actual_New_Specialty_Name}                  Get Value     xpath://*[@id="3"]
    Should be equal                               ${Actual_New_Specialty_Name}    ${Existing_Specialty_Name}



End Web Test
    close browser
