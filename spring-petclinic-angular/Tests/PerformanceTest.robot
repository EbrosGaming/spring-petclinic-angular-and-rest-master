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
${Firstname}                                Anna
${Lastname}                                 Ramsey
${Adress1}                                  Zooet
${City1}                                    Göteborg
${Mobile1}                                  070234234
${Give_New_PetName_1}                       Venus
${Give_New_PetName_2}                       Jupiter
${NewPet_BirthDate}                         2021/04/19
${Verify_pet_1_Added}                       Venus
${Verify_Pet_2_Added}                       Jupiter
${Updated_Last_Name}                        Jackson
${Verify_Last_Name}                         Anna Jackson


*** Test Cases ***
AddOwner->Add2Pets->DeletePet->ChangeLastName->AddPetType->DeletePetType
  [Documentation]                          Testing adding a newpet and verifying
  [Tags]                                   Performance Testing
  Given User Adds An Owner
  When User Verifies Owner Added
  And User Adds Two Pets To An Owner
  And User Verifies Two Pets Adedd To The owner
  And User Removes a Pet
  And User Verifies Pet Removed
  And User Changes The Last Name
  Then User Verifies Updated Last Name