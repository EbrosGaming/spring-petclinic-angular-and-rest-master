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
${Firstname}                                Donald
${Lastname}                                 Duck
${Owner_fullname}                           Donald Duck
${Adress1}                                  DisneyLand
${City1}                                    LasAngeles
${Mobile1}                                  123456789
${Give_New_PetName_1}                       Venus
${NewPet_BirthDate}                         2021/05/19
${Verify_pet_1_Added}                       Venus
${Owner_Information_Page}                   Owner Information
${Visit_Date}                               2021/05/26
${Visit_Description}                        Vaccination



*** Test Cases ***
Test To AddOwner->AddAPet->AddVisit
  [Documentation]                          Testing With Owner
  [Tags]                                   Test_1 Performance Testing
  Given User Adds An Owner
  When User Adds A Pet To The Owner
  Then User Adds A Visit To The Newly Added pet



