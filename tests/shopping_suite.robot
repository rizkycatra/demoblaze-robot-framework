*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/page_objects/product_keywords.resource
Resource    ../resources/page_objects/login_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
User Successfully Purchases Product
    ${username}=    User Login with Credentials    rizkytest_1    password_1
    Verify Login Success    ${username}
    User Selects Category    Laptops
    ${product}=    User Selects Product   Sony vaio i5
    User Adds Product To Cart   ${product}
    ${name}    ${credit_card}    ${total_amount}=    User Completes Checkout
    Verify The Order Data    ${name}    ${credit_card}    ${total_amount}