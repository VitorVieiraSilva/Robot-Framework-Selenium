*** Settings ***
Resource    main.resource

*** Keywords ***

click "Signup / Login" button
    Wait Until Element Is Visible    xpath=//a[@href="/login"]
    Click Element    xpath=//a[@href="/login"]
enter a valid email address and password
    Wait Until Element Is Visible    xpath=//input[@data-qa="login-email"]
    Input Text    xpath=//input[@data-qa="login-email"]        ${EMAIL}
    Input Text    xpath=//input[@data-qa="login-password"]     @Test2025
    Click Button    xpath=//button[@data-qa="login-button"]
should see "Logged in as ${NAME}"
    Wait Until Element Is Visible    xpath=//a[contains(text(),"Logged in as")]    10s
    Element Should Contain    xpath=//a[contains(text(),"Logged in as")]    ${NAME}

Delete User By API And Close Browser
    Delete User By API
    Close Browser

enter a invalid email address and password
    Wait Until Element Is Visible    xpath=//input[@data-qa="login-email"]
    Input Text    xpath=//input[@data-qa="login-email"]    invaliduser@test.com
    Input Text    xpath=//input[@data-qa="login-password"]    invalidpassword
    Click Button    xpath=//button[@data-qa="login-button"]

should see an error message "Your email or password is incorrect!"
    Wait Until Element Is Visible    xpath=//p[@style="color: red;"]    10s
    Element Should Contain    xpath=//p[@style="color: red;"]    Your email or password is incorrect!
