*** Settings ***
Library         SeleniumLibrary
Library         ../variables/variables.py
Library         OperatingSystem
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${chrome_bin}=    Get Environment Variable    CHROME_BIN    ${None}
    IF    '${chrome_bin}' != '${None}'
        ${options.binary_location}=    Set Variable    ${chrome_bin}
    END

    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    IF    ${is_headless}
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --window-size\=1920,1080
    END

    Open Browser    ${URL}    browser=chrome    options=${options}

    Go To    ${URL}
    IF    not ${is_headless}    Maximize Browser Window

Finish Test
    Close Browser
