*** Settings ***
Resource    ../resources/page_objects/login_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
Login With Valid Credentials
    ${username}=    User Login with Credentials    ${DEFAULT_USER}    ${DEFAULT_PASS}
    Verify Login Success    ${username}

Invalid Login Scenarios
    [Template]    Login with Invalid Credentials
    ${DEFAULT_USER}    wrong_pass    Wrong password.
    wrong_user    ${DEFAULT_PASS}    Wrong password.
    wrong_user    wrong_pass    Wrong password.
    ${EMPTY}    ${EMPTY}    Please fill out Username and Password.
    ${DEFAULT_USER}    ${EMPTY}    Please fill out Username and Password.
    ${EMPTY}    ${DEFAULT_PASS}    Please fill out Username and Password.
