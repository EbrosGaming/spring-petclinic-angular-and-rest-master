*** Keywords ***
Begin Web Tests
    Open Browser            about:blank     ${BROWSER}
    Load Web
    Verify Page Loaded
    Set Selenium Speed                                .5
Load Web
    Go To                           ${URL}
Verify Page Loaded
    ${GET_TITLE}                    Get Title
    Should Be Equal                 ${GET_TITLE}                          SpringPetclinicAngular
    Page Should Contain             ${WELCOME_MESSAGE}                     Welcome to Petclinic


User Is On Specialities Page
    Wait Until Element Is Visible   xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a
    click element                   xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a

User Is On Edit Specialities Page
    click element                   xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a
    Page Should Contain Element     xpath://*[@id="specialties"]
    Page Should Contain Element     xpath://*[@id="specialties"]/tbody/tr[2]/td[2]/button[1]
    Click Button                    xpath://*[@id="specialties"]/tbody/tr[2]/td[2]/button[1]
    Page Should Contain Element     xpath:/html/body/app-root/app-specialty-edit/div/div/h2
    Element Should Be Visible       xpath:/html/body/app-root/app-specialty-edit/div/div/h2
    Click Element                   xpath:/html/body/app-root/div[1]/nav/div/ul/li[1]/a/span[2]
    #Click Button                    xpath://*[@id="specialty"]/div[2]/div/button[1]
Clicks on Home Button
    page should contain button       Home
    click button                     Home
    sleep                           .25

Comes back to the Home Page
    Page Should Contain             ${WELCOME_MESSAGE}
    Element Should Be Visible       xpath:/html/body/app-root/app-welcome/div/div/div/div/img
    sleep                           .25

End Web Tests
    Close Browser
