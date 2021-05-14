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
#${New_Pettype_Name}                         Bunny
#${Expected_Name}                            Bunny
${Expected_Pettypes_Page}                   Pet Types
${New_Pettype_Name}                         bunny
${Existing_Pettype_Name}                    Get Value     xpath://*[@id="0"]

*** Test Cases ***
Test To AddOwner->Add2Pets->DeletePet->ChangeLastName
  [Documentation]                          Testing With Owner
  [Tags]                                   Test_1 Performance Testing
  Given User Adds An Owner
  When User Adds Two Pets To The Owner
  And User Removes A Pet
  And User Changes The Last Name Of The Owner
  Then The Owner Has One Pet And Updated LastName


*** Test Cases ***
Test To AddPetType->DeletePet
  [Documentation]                          Testing With PetType
  [Tags]                                   Test_2 Performance Testing
  Given User Adds A New PetType
  When User Deletes The PetType
  Then PetType Is Removed From The List