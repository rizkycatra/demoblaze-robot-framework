*** Settings ***
Library    SeleniumLibrary
Resource    common.resource

*** Keywords ***
User Login with Credentials
    Click Element    id:login2
    Wait Until Element Contains    id:logInModalLabel    Log in       timeout=${TIMEOUT}
    [Arguments]    ${username}    ${password}
    Input Text    id:loginusername    ${username}
    Input Password    id:loginpassword    ${password}
    Click Button    xpath=(//button[normalize-space()='Log in'])[1]
    RETURN    ${username}

Verify Login Success
    [Arguments]    ${username}
    Wait Until Page Contains    Welcome ${username}    timeout=${TIMEOUT}
    Wait Until Page Contains    Log out    timeout=${TIMEOUT}

Login with Invalid Credentials
    Click Element    id:login2
    Wait Until Element Contains    id:logInModalLabel    Log in       timeout=${TIMEOUT}
    [Arguments]    ${username}    ${password}    ${error}
    Input Text    id:loginusername    ${username}
    Input Password    id:loginpassword    ${password}
    Click Button    xpath=(//button[normalize-space()='Log in'])[1]
    ${message}=    Handle Alert    timeout=${TIMEOUT}
    Should Be Equal    ${message}    ${error}
    Reload Page
