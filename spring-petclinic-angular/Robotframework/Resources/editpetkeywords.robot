*** Settings ***
Library    SeleniumLibrary
*** Keywords ***


Begin Web Test

     Open browser                                  about:blank       ${BROWSER}

     Maximize Browser Window

     Set Selenium Speed                            0

Go to Web Page

     Load Page

     Verify Page Loaded

Load Page

    Go to                                         ${URL}
    Wait Until Page Contains                      Welcome to Petclinic

    Set Selenium Speed                            0

Verify Page Loaded

    ${actualTerm}                                  get text     xpath:/html/body/app-root/app-welcome/h1

    Should Be Equal                                Welcome to Petclinic    ${actualTerm}

Go to list of owners

    Go to Web Page

    Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a

    Click Element                                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a

Click on a owner then edit on it's pet

    Click Element                                   xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a

    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[1]

Edit infomation on the pet

    Input Text                                      id=name     Fido

    ${EXPECTED_PET}                                 Get Text    id=name

    Should Be Equal                                 ${EXPECTED_PET}   ${CONFIGURED_PET}

    Input Text                                      xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input     2001/01/01

    ${EXPECTED_DATE}                                Get Text    xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input

    Should Be Equal                                 ${EXPECTED_DATE}   ${CONFIGURED_DATE}

    Click Element                                   xpath://*[@id="type"]/option[2]

    Click Element                                   xpath:/html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]

End Web Test

    Close Browser

