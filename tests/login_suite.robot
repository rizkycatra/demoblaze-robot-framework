*** Settings ***
Resource    ../resources/page_objects/login_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
Login With Valid Credentials
    ${username}=    User Login with Credentials    rizkytest_1    password_1
    Verify Login Success    ${username}

Invalid Login Scenarios
    [Template]    Login with Invalid Credentials
    rizkytest_1    wrong_pass    Wrong password.
    wrong_user    password_1    Wrong password.
    wrong_user    wrong_pass    Wrong password.
    ${EMPTY}    ${EMPTY}    Please fill out Username and Password.
    rizkytest_1    ${EMPTY}    Please fill out Username and Password.
    ${EMPTY}    password_1    Please fill out Username and Password.
