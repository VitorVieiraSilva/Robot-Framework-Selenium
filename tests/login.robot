*** Settings ***
Resource    ../resources/login.resource
Test Teardown    Close All Browsers

*** Test Cases ***
# Login with valid user
#     [Setup]    Create User By API
#     [Teardown]    Delete User By API And Close Browser
#     Given the user is on automationexercise site
#     When click "Signup / Login" button
#     And enter a valid email address and password
#     Then should see "Logged in as ${NAME}"

Login with invalid user
    Given the user is on automationexercise site
    When click "Signup / Login" button
    And enter a invalid email address and password
    Then should see an error message "Your email or password is incorrect!"