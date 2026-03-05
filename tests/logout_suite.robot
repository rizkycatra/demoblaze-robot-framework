*** Settings ***
Resource    ../resources/page_objects/logout_keywords.resource
Resource    ../resources/page_objects/login_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
User Should Be Able To Logout After Login
    ${username}=    User Login with Credentials    ${DEFAULT_USER}    ${DEFAULT_PASS}
    Verify Login Success    ${username}
    User Logout