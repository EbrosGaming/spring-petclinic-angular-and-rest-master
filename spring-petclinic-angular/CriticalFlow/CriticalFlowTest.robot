*** Settings ***
Documentation                               Infotiv Petclinic Performance Test
Resource                                    ../Resources/CriticalFlowKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic
${Add_Owner_page}                           New Owner
${Firstname}                                Donald
${Lastname}                                 Duck
${Owner_fullname}                           Donald Duck
${Adress}                                   DisneyLand
${City}                                     LasAngeles
${Mobile}                                   123456789
${New_ownerPage}                            New Owner
${Owners_List_Page}                         Owners
${Add_PetPage}                              Add Pet
${Give_New_PetName}                         Venus
${NewPet_BirthDate}                         2021/05/19
${Verify_pet_1_Added}                       Venus
${Owner_Information_Page}                   Owner Information
${Visit_Date}                               2021/05/26
${Visit_Description}                        Vaccination




*** Test Cases ***
Test To AddOwner->AddAPet->AddVisit
  [Documentation]                          Testing with add owner,add pet and add visit
  [Tags]                                   Critical flow test
  Given User Adds An Owner
  When User Adds A Pet To The Owner
  And Adds A Visit To The Newly Added pet
  Then A New Owner Created,Added a Pet And Added A Visit To The Pet



