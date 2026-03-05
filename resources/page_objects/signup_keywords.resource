*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    common.resource
Resource    login_keywords.resource

*** Keywords ***
User Signup With Valid Credentials
    Click Element    id:signin2
    Wait Until Element Contains    id:signInModalLabel    Sign up    timeout=${TIMEOUT}
    ${random_username}=    Generate Random String    4    [NUMBERS][LETTERS]
    ${password}=    Generate Random String    10    [NUMBERS][LETTERS][SPECIALS]
    ${username}=    Set Variable    rizky_${random_username}
    Input Text    id:sign-username    ${username}
    Input Password    id:sign-password    ${password}
    Click Button    xpath=//button[normalize-space()='Sign up']
    Alert Should Be Present    Sign up successful.    ACCEPT
    # return the generated credentials so the caller can log in if needed
    RETURN   ${username}    ${password}

User Signup With Invalid Credentials
    [Arguments]    ${username}    ${password}    ${error}
    Click Element    id:signin2
    Wait Until Element Contains    id:signInModalLabel    Sign up    timeout=${TIMEOUT}
    Input Text    id:sign-username    ${username}
    Input Password    id:sign-password    ${password}
    Click Button    xpath=//button[normalize-space()='Sign up']
    ${message}=    Handle Alert    timeout=${TIMEOUT}
    Should Be Equal    ${message}    ${error}
    Reload Page