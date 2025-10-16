*** Settings ***
Resource    main.resource
*** Variables ***

*** Keywords ***
Open And Maximize Browser
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${options}    add_argument    --disable-save-password-bubble
    # Call Method    ${options}    add_argument    --disable-infobars
    # Call Method    ${options}    add_argument    --disable-notifications
    # Call Method    ${options}    add_argument    --disable-popup-blocking
    # Call Method    ${options}    add_argument    --disable-translate
    # ${disable_features_arg}=    Set Variable    --disable-features=AutofillServerCommunication,PasswordManagerOnboarding,PasswordLeakDetection
    # Call Method    ${options}    add_argument    ${disable_features_arg}
    # ${disable_blink_arg}=    Set Variable    --disable-blink-features=PasswordLeakDetection
    # Call Method    ${options}    add_argument    ${disable_blink_arg}
    # ${prefs}=    Evaluate    {"credentials_enable_service": False, "profile.password_manager_enabled": False, "password_manager_enabled": False, "password_manager_leak_detection_enabled": False, "autofill.profile_enabled": False, "autofill.credit_card_enabled": False, "safebrowsing.enabled": False}
    # Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    # Create Webdriver    Chrome    options=${options}
    # Go To    https://automationexercise.com
    # Dismiss Password Leak Popup
    the user is on automationexercise site


Delete Account Logged And Close Browser
    delete account logged
    Close Browser
that I want to create a new user on automationexercise.com
    Title Should Be    Automation Exercise
    #Click Element    xpath=//a[contains(text(),'Signup / Login')]
    Click Element    xpath=//a[@href="/login"]
    Wait Until Element Is Visible    xpath=//*[@data-qa="signup-button"]    10s
    Fill name and email address on signup/login page    ${NAME}    ${EMAIL}

I fill in the registration form correctly
    Fill complete form with valid data
the account should be created successfully
    Wait Until Page Contains    Account Created!    10s


Fill name and email address on signup/login page
    [Arguments]    ${name}    ${email}
    Input Text    xpath=//input[@data-qa='signup-name']    ${NAME}
    Input Text    xpath=//input[@data-qa='signup-email']    ${EMAIL}

Fill complete form with valid data
    Click Button    xpath=//button[@data-qa='signup-button']
    Wait Until Page Contains    Enter Account Information
    Click Element    id=id_gender1
    Input Text    id=password    @Test2025
    Select From List By Value    id=days    10
    Select From List By Value    id=months    5
    Select From List By Value    id=years    1990
    Input Text    id=first_name    ${NAME}
    Input Text    id=last_name    Silva
    Input Text    id=address1    Rua Exemplo, 123
    Select From List By Value    id=country    Canada
    Input Text    id=state    Estado
    Input Text    id=city    Cidade
    Input Text    id=zipcode    12345
    Input Text    id=mobile_number    11999999999
    Scroll Element Into View    xpath=//button[@data-qa='create-account']
    Click Button    xpath=//button[@data-qa='create-account']

delete account logged
    Wait Until Page Contains    Account Created!    10s
    Dismiss Password Leak Popup
    Wait Until Element Is Visible    xpath=//a[@data-qa="continue-button"]
    Click Element                    xpath=//a[@data-qa="continue-button"]
    Wait Until Element Is Visible    xpath=//a[@href="/delete_account"]
    Click Element    xpath=//a[@href="/delete_account"]
    Wait Until Page Contains    Account Deleted!    10s

Dismiss Password Leak Popup
    # Tenta fechar popups modais em PT/EN (vários textos possíveis)
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(., 'Não agora')]    2s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(., 'Não agora')]
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(., 'Agora não')]    2s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(., 'Agora não')]
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(., 'Not now')]    2s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(., 'Not now')]
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(., 'Change password')]    2s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(., 'Change password')]
