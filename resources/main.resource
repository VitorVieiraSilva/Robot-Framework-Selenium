*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           String

*** Variables ***
${BASE_URL}       https://automationexercise.com/api
${ENDPOINT}       /createAccount
${EMAIL}          vitorsilva@test.com
${PASSWORD}       @Test2025
${NAME}           Vitor

*** Keywords ***
Create User By API
    Create Session    cadastro    ${BASE_URL}
    ${payload}=    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASSWORD}  title="Mr"  birth_date="12"
    ...  birth_month="10"  'birth_year="1988"  firstname=${NAME}  lastname="Silva"  address1="Rua teste"  country="Unites States"
    ...  zipcode="45995-000"  state="California"  city="Los Angeles"  mobile_number="555-555-55"

    ${response}=    RequestsLibrary.Post On Session    cadastro    ${ENDPOINT}    data=${payload}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()['message']}    User created!
    Should Be Equal As Strings    ${response.json()}[responseCode]    201

Delete User By API
    Create Session    deleteUser    ${BASE_URL}
    ${payload}=    Create Dictionary    email=${EMAIL}    password=${PASSWORD}
    ${response}=    RequestsLibrary.Delete On Session    deleteUser    /deleteAccount    data=${payload}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()['message']}    Account deleted!

the user is on automationexercise site
    Open Browser    https://automationexercise.com    Chrome
    Maximize Browser Window
