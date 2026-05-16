*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    IF    ${is_headless}
        ${chrome_arguments}=    Create List
        ...    --no-sandbox
        ...    --disable-dev-shm-usage
        ...    --disable-gpu
        ...    --window-size=1920,1080

        ${options}=    Create Dictionary    args=${chrome_arguments}

        Open Browser    ${URL}    browser=headlesschrome    options=${options}
    ELSE
        Open Browser    ${URL}    browser=chrome
        Maximize Browser Window
    END

Finish Test
    Close Browser
