*** Settings ***
Library         SeleniumLibrary
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}
    ${dynamic_driver_path}=    Get Chrome Driver Path

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    IF    ${is_headless}
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-gpu
        Call Method    ${options}    add_argument    --window-size\=1920,1080
    END

    Create Webdriver    Chrome    options=${options}

    Go To    ${URL}
    IF    not ${is_headless}    Maximize Browser Window

Finish Test
    Close Browser
