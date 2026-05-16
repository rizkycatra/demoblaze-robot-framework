*** Settings ***
Library         SeleniumLibrary
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    IF    ${is_headless}
        ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
        Call Method    ${firefox_options}    add_argument    --headless

        Open Browser    ${URL}    browser=firefox    options=${firefox_options}
    ELSE
        ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Create Webdriver    Chrome    options=${chrome_options}
        Go To    ${URL}
        Maximize Browser Window
    END

Finish Test
    Close Browser
