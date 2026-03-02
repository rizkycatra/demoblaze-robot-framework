*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    common.resource
Resource    login_keywords.resource

*** Keywords ***
User Signup With Valid Credentials
    Click Element    id:signin2
    Wait Until Element Contains    id:signInModalLabel    Sign up    timeout=10s
    ${random_username}=    Generate Random String    4    [NUMBERS][LETTERS]
    ${password}=    Generate Random String    10    [NUMBERS][LETTERS][SPECIALS]
    ${username}=    Set Variable    rizky_${random_username}
    Input Text    id:sign-username    ${username}
    Input Password    id:sign-password    ${password}
    Click Button    xpath=//button[normalize-space()='Sign up']
    Alert Should Be Present    Sign up successful.    ACCEPT
    #To make sure the username and password laready created by logging in
    User Login with Credentials    ${username}    ${password}
    Verify Login Success    ${username}

User Signup With Invalid Credentials
    [Arguments]    ${username}    ${password}    ${error}
    Click Element    id:signin2
    Wait Until Element Contains    id:signInModalLabel    Sign up    timeout=10s
    Input Text    id:sign-username    ${username}
    Input Password    id:sign-password    ${password}
    Click Button    xpath=//button[normalize-space()='Sign up']
    ${message}=    Handle Alert    timeout=10s
    Should Be Equal    ${message}    ${error}
    Reload Page