*** Settings ***
Library         SeleniumLibrary
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    IF    '${is_headless}' == 'True' or '${is_headless}' == 'true' or '${is_headless}' == '${True}'
        ${options}=    Set Variable
        ...    add_argument("--headless=new");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--disable-gpu");add_argument("--window-size=1920,1080")

        Open Browser    ${URL}    browser=chrome    options=${options}
    ELSE
        Open Browser    ${URL}    browser=chrome
        Maximize Browser Window
    END

Finish Test
    Close Browser
