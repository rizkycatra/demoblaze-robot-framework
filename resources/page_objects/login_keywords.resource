*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
User Login with Credentials
    Click Element    id:login2
    Wait Until Element Contains    id:logInModalLabel    Log in       timeout=10s
    [Arguments]    ${username}    ${password}
    Input Text    id:loginusername    ${username}
    Input Password    id:loginpassword    ${password}
    Click Button    xpath=(//button[normalize-space()='Log in'])[1]
    RETURN    ${username}

Verify Login Success
    [Arguments]    ${username}
    Wait Until Page Contains    Welcome ${username}    timeout=10s
    Wait Until Page Contains    Log out    timeout=10s

Login with Invalid Credentials
    Click Element    id:login2
    Wait Until Element Contains    id:logInModalLabel    Log in       timeout=10s
    [Arguments]    ${username}    ${password}    ${error}
    Input Text    id:loginusername    ${username}
    Input Password    id:loginpassword    ${password}
    Click Button    xpath=(//button[normalize-space()='Log in'])[1]
    ${message}=    Handle Alert    timeout=10s
    Should Be Equal    ${message}    ${error}
    Reload Page
