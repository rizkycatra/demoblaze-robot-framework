*** Settings ***
Library         SeleniumLibrary
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    IF    ${is_headless}
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
    END

    ${service}=    Evaluate
    ...    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${DRIVER_PATH}')
    ...    sys

    Create Webdriver    Chrome    options=${options}    service=${service}

    Go To    ${URL}
    Maximize Browser Window

Finish Test
    Close Browser
