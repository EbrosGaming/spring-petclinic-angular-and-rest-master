*** Keywords ***
Begin Web Tests
    Open Browser            about:blank     ${BROWSER}
    Load Web
    Verify Page Loaded
Load Web
    Go To                   ${URL}
Verify Page Loaded
    ${GET_TITLE}            Get Title
    Should Be Equal         ${GET_TITLE}                          SpringPetclinicAngular
    Page Should Contain     ${WELCOME_MESSAGE}                    Welcome to Petclinic
User Clicks Owners
    Page Should Contain Element                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a         # Owners Tab
    Click Element                               xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
     Sleep                                         .5
All Owners
    Page Should Contain Element                //*[@routerlink="/owners"]
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain Element         xpath:/html/body/app-root/app-owner-list/div/div/h2               #Owners List
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/h2
     Sleep                                         .5
    Page Should Contain Element         //*[@class="table table-striped"]
    Element Should Be Visible           //*[@class="table table-striped"]
     Sleep                                         .5
Visit is Added To The Pet
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Element Should Be Visible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    ${VISIT_DATE}
    Input Text                          //*[@id="description"]    ${VISIT_DESCRIPTION}
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]
    Wait Until Page Contains Element    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
    Element Should Be VIsible           xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[2]
     Sleep                                         .5

Delete Pet Visit
    Wait Until Page Contains Element   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Element Should Be Visible          xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
    Click Element                      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
     Sleep                                         .5
Verify Visit is Deleted
     Wait Until Element Is Not Visible     ${VISIT_DESCRIPTION}
     Element Should Not Be Visible         ${VISIT_DESCRIPTION}
      Sleep                                         .5
End Web Tests
    Close Browser
