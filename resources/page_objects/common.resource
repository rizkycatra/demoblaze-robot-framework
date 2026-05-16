*** Settings ***
Library         SeleniumLibrary
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    IF    '${IS_HEADLESS}' == 'True' or '${IS_HEADLESS}' == 'true' or '${IS_HEADLESS}' == '${True}'
        ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
        Call Method    ${options}    add_argument    --headless=new
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-gpu
        Call Method    ${options}    add_argument    --window-size=1920,1080

        Create Webdriver    Chrome    options=${options}
        Go To    ${URL}
    ELSE
        Open Browser    ${URL}    ${BROWSER}
        Maximize Browser Window
    END

Finish Test
    Close Browser
