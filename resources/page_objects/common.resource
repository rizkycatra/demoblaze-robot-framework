*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***
User Open The Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Finish Test
    Close Browser