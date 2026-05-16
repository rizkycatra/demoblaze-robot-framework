*** Settings ***
Library         SeleniumLibrary
Library         String
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    ${headless_str}=    Convert To Lowercase    ${is_headless}

    IF    '${headless_str}' == 'true'
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
