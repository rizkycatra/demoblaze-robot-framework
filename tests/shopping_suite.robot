*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/page_objects/product_keywords.resource
Resource    ../resources/page_objects/login_keywords.resource
Test Setup    User Open The Website
Test Teardown    Finish Test

*** Test Cases ***
User Successfully Purchases Product
    ${username}=    User Login with Credentials    ${DEFAULT_USER}    ${DEFAULT_PASS}
    Verify Login Success    ${username}
    User Selects Category    Laptops
    ${product}=    User Selects Product And Add To Cart   Sony vaio i5
    User Checks The Product On Cart   ${product}
    ${name}    ${credit_card}    ${total_amount}=    User Completes Checkout
    Verify The Order Data    ${name}    ${credit_card}    ${total_amount}

User Successfully Purchases Multiple Products
    ${username}=    User Login with Credentials    ${DEFAULT_USER}    ${DEFAULT_PASS}
    Verify Login Success    ${username}
    User Selects Category    Laptops
    ${product_1}=    User Selects Product And Add To Cart    Sony vaio i7
    User Selects Category    Monitors
    ${product_2}=    User Selects Product And Add To Cart    Apple monitor 24
    User Selects Category    Phones
    ${product_3}=    User Selects Product And Add To Cart    HTC One M9
    User Checks The Product On Cart    ${product_1}    ${product_2}    ${product_3}  
    ${name}    ${credit_card}    ${total_amount}=    User Completes Checkout
    Verify The Order Data    ${name}    ${credit_card}    ${total_amount}


    