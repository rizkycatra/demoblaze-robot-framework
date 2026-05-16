*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    IF    '${is_headless}' == 'True' or '${is_headless}' == 'true' or '${is_headless}' == '${True}'
        ${chrome_arguments}=    Create List
        ...    --headless=new
        ...    --no-sandbox
        ...    --disable-dev-shm-usage
        ...    --disable-gpu
        ...    --window-size=1920,1080

        ${options}=    Create Dictionary    args=${chrome_arguments}
        Open Browser    ${URL}    browser=chrome    options=${options}
    ELSE
        Open Browser    ${URL}    browser=chrome
        Maximize Browser Window
    END

Finish Test
    Close Browser
