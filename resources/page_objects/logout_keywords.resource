*** Settings ***
Library    SeleniumLibrary
Resource    common.resource


*** Keywords ***
User Logout
    Click Element    id:logout2
    Wait Until Page Contains    Log in    timeout=10s
    
    