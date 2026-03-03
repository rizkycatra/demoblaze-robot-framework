*** Settings ***
Resource    ../resources/page_objects/signup_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
New User Can Signup And Login
    ${username}    ${password}=    User Signup With Valid Credentials
    User Login with Credentials    ${username}    ${password}
    Verify Login Success    ${username}

Signup With Invalid Credentials
    [Template]    User Signup With Invalid Credentials
    rizkytest_1    password_1    This user already exist.
    ${EMPTY}    password_ads33    Please fill out Username and Password.
    rizkytest_Ads33    ${EMPTY}    Please fill out Username and Password.
    ${EMPTY}    ${EMPTY}    Please fill out Username and Password.    