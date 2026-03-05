*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    String
Library    Collections
Resource    common.resource

*** Keywords ***
User Selects Category
    [Arguments]    ${category}
    Wait Until Element Is Visible    link=${category}    timeout=${TIMEOUT}
    Click Element    link=${category}

User Selects Product And Add To Cart
    [Arguments]    ${product}
    Wait Until Element Is Visible    link=${product}    timeout=${TIMEOUT}
    Click Element    link=${product}
    Wait Until Element Is Visible    xpath=//a[normalize-space()='Add to cart']    timeout=${TIMEOUT}
    Click Element    xpath=//a[normalize-space()='Add to cart']
    Alert Should Be Present    Product added.    timeout=${TIMEOUT}
    Click Link    id:nava
    RETURN    ${product}

User Checks The Product On Cart
    [Arguments]    @{products}
    Click Link    id:cartur
    FOR    ${product_cart}    IN    @{products}
        Wait Until Page Contains   ${product_cart}    timeout=${TIMEOUT}
    END

User Completes Checkout
    Click Button    xpath=//button[normalize-space()='Place Order']
    Wait Until Element Is Visible    id:orderModal    timeout=${TIMEOUT}
    #Get and Clean the total amount
    Wait Until Element Is Visible    id:totalm    timeout=${TIMEOUT}
    ${get_total_amount}=    Get Text    id:totalm  
    ${fix_total_amount}=    Remove String    ${get_total_amount}    Total:
    ${total_amount}=    Strip String    ${fix_total_amount} 
    #Fill the order field
    ${name}=    Name
    ${country}=    Country
    ${city}=    City
    ${creditcard}=    Credit Card Number
    ${cc_month}=    Month
    ${cc_year}=    Year
    Input Text    id:name    ${name}
    Input Text    id:country    ${country}
    Input Text    id:city    ${city}
    Input Text    id:card    ${creditcard}
    Input Text    id:month    ${cc_month}
    Input Text    id:year    ${cc_year}
    Click Button    xpath=//button[normalize-space()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!    timeout=${TIMEOUT}
    RETURN    ${name}    ${creditcard}    ${total_amount}

Verify The Order Data
    [Arguments]    ${name}    ${credit_card}    ${total_amount}
    ${purchase_data}=    Get Text    xpath=//p[@class='lead text-muted ']
    # Split the purchase data
    ${split_data}=    Split String    ${purchase_data}    \n
    ${split_order_id}=    Get From List    ${split_data}    0 
    ${split_amount}=    Get From List    ${split_data}    1 
    ${split_credit_card}=    Get From List    ${split_data}    2 
    ${split_name}=    Get From List    ${split_data}    3 
    ${split_date}=    Get From List    ${split_data}    4 
    # Clean the purchase data
    ${fix_order_id}=    Remove String    ${split_order_id}    Id: 
    ${order_id}=    Strip String    ${fix_order_id}
    ${fix_amount}=    Remove String    ${split_amount}    Amount:      USD
    ${amount}=    Strip String    ${fix_amount}
    ${fix_credit_card}=    Remove String    ${split_credit_card}    Card Number: 
    ${purchase_credit_card}=    Strip String    ${fix_credit_card}
    ${fix_name}=    Remove String    ${split_name}    Name: 
    ${purchase_name}=    Strip String    ${fix_name}
    ${fix_date}=    Remove String    ${split_date}    Date: 
    ${date}=    Strip String    ${fix_date}
    # Verify the data
    Should Be Equal    ${name}    ${purchase_name}
    Should Be Equal    ${credit_card}    ${purchase_credit_card}
    Should Be Equal    ${total_amount}    ${amount}  
    #Finish the order
    Click Button    xpath=//button[contains(@class, 'confirm')]  
    
