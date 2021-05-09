*** Keywords ***
Begin Web Tests
    Open Browser            about:blank     ${BROWSER}
    Load Web
    Verify Page Loaded
    Set Selenium Speed                                .25
Load Web
    Go To                   ${URL}
Verify Page Loaded
    ${GET_TITLE}            Get Title
    Should Be Equal         ${GET_TITLE}                          SpringPetclinicAngular
    Page Should Contain     ${WELCOME_MESSAGE}                    xpath:/html/body/app-root/app-welcome/h1
User Clicks Owners
    Page Should Contain Element                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a         # Owners Tab
    Click Element                               xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
     Sleep                                         .25
All Owners
    Page Should Contain Element                //*[@routerlink="/owners"]
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-list/div/div/h2               #Owners List
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/h2
     Sleep                                         .25
    Page Should Contain Element         //*[@class="table table-striped"]
    Element Should Be Visible           //*[@class="table table-striped"]
     Sleep                                         .25
Visit is Added To The Pet
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Sleep                                         .25
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    ${VISIT_DATE}
    Input Text                          //*[@id="description"]    ${VISIT_DESCRIPTION}
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]
    Wait Until Page Contains Element    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
    Element Should Be VIsible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
     Sleep                                         .25

Delete Pet Visit
    Wait Until Page Contains Element   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Element Should Be Visible          xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Click Element                      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
     Sleep                                         .25
Verify Visit is Deleted
     Wait Until Element Is Not Visible     ${VISIT_DATE}
     Element Should Not Be Visible         ${VISIT_DATE}
     Wait Until Element Is Not Visible     ${VISIT_DESCRIPTION}
     Element Should Not Be Visible         ${VISIT_DESCRIPTION}
      Sleep                                         .25
User Selects Owner 6
    User Clicks Owners
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-list/div/div/h2               #Owners List
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/h2
     Sleep                                         .25
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
      Sleep                                         .25


Selects Pet Samantha
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/h2[2]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
      Sleep                                         .25
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[1]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[2]
    #Element Should Be Visible        ${SVISIT_DATE}
    #Element Should Be Visible        ${SVISIT_DESCRIPTION}
      Sleep                                          .25

Deletes Visit For Rabies Shot

    Page Should Contain Element         xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[2]/td[3]/button[2]
      Sleep                                          .25
Verify Visit is Deleted For Rabies Shot
    Wait Until Element Is Not Visible     ${SVISIT_DATE}
    Element Should Not Be Visible         ${SVISIT_DATE}
    Wait Until Element Is Not Visible     ${SVISIT_DESCRIPTION}
    Element Should Not Be Visible         ${SVISIT_DESCRIPTION}
     Sleep                                         .25
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    ${SVISIT_DATE}
    Input Text                          //*[@id="description"]                      ${SVISIT_DESCRIPTION}
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]

End Web Tests
    Close Browser