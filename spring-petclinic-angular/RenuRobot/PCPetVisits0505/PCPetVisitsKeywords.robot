*** Keywords ***
Begin Web Tests
    Open Browser            about:blank     ${BROWSER}
Go To Web Page
    Load Web
    Verify Page Loaded
Load Web
    Go To                   ${URL}
Verify Page Loaded
    ${GET_TITLE}            Get Title
    Should Be Equal         ${GET_TITLE}        SpringPetclinicAngular
    Page Should Contain                         Welcome to Petclinic
Click Owners
    Page Should Contain Element                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a         # Owners Tab
    Click Element                               xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
All Owners
    Page Should Contain Element                //*[@routerlink="/owners"]
    Click Element                               //*[@routerlink="/owners"]
    Page Should Contain                         Owners
    Page Should Contain Element         //*[@class="table table-striped"]
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[1]      Name
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[2]      Address
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[3]      City
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[4]      Telephone
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[5]      Pets
Create Pet Visit
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    2021/05/30
    Input Text                          //*[@id="description"]    Checkup
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]
Edit Pet Visit
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[1]
     Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[1]
     Clear Element Text                  //*[@id="description"]
     Input Text                          //*[@id="description"]    Vaccin
     Click Button                        //*[@id="visit"]/div[2]/div/button[2]
Delete Pet Visit
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
     Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]
End Web Tests
    Close Browser