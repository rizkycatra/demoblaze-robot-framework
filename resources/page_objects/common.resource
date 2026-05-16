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
        ...    --headless=new

        ${options}=    Create Dictionary    args=${chrome_arguments}

        # Gunakan browser=chrome namun disuntik dengan options di atas
        Open Browser    ${URL}    browser=chrome    options=${options}
    ELSE
        Open Browser    ${URL}    browser=chrome
        Maximize Browser Window
    END

Finish Test
    Close Browser
