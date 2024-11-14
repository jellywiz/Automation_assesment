*** Settings ***
Resource    ../../Libraries/common.resource
Resource    ../Variables/domain_environemts.resource
Resource    ../Locators/input.resource
Resource    ../Locators/containers.resource
Resource    ../Locators/button.resource
Resource    ../Locators/table.resource

*** Keywords ***
#This is how to input the number of the quantity of a product
Quantity Input For The Product
    [Arguments]    ${quantity}
    Input Text    ${Quantity_path}    ${quantity}

Get The Quantity Of The Product
    @{info_list}    Create List
    ${info}    Get Webelements    ${Product_info}
    FOR    ${i}    IN    @{info}
        ${text}    Get Text    ${i}
        Append To List    ${info_list}    ${text}
    END
    ${total_price}    Calculate The Price Of The Product    ${info_list}[1]
    Append To List    ${info_list}    ${quantity_of_product}
    ${total_price}    Convert To String    ${total_price}
    Append To List    ${info_list}    ${total_price}
    ${info_list}    Evaluate    sorted(${info_list})
    Set Test Variable    ${info_list}

Calculate The Price Of The Product
    [Arguments]    ${price}
    ${price}    Evaluate    ${price} * ${quantity_of_product}
    RETURN    ${price}

Click On The Add To Cart Button
    Click Element    ${ADD TO CART BTN}
    Wait Until Page Contains Element    //button[normalize-space()='✔ ADDED' and contains(@class, 'added')]
    Wait Until Page Does Not Contain Element    //button[normalize-space()='✔ ADDED' and contains(@class, 'added')]

Click On The Cart Icon And Wait For The Cart Container
    Click Element    ${Cart Icon}
    Wait Until Page Contains Element    ${CART CONTAINER}

Get The Info Of The Product In The Product Container
    @{info container}    Create List
    ${info}    Get Webelements    ${product_info_container}
    ${counter}    Set Variable    0
    FOR    ${i}    IN    @{info}
        ${counter}    Set Variable    ${counter} + 1
        ${text}    Get Text    ${i}
        IF    ${counter} == 3
            ${text}    Evaluate    '${text}'.split(' ')[0]
        END
        Append To List    ${info container}    ${text}
    END
    ${info container}    Evaluate    sorted(${info container})
    Set Test Variable    ${info container}

Compare The Info Of The Product With The Container
    Should Be Equal    ${info_list}    ${info container}

Go To Proceed Checkout
    Click Element    ${PROCEED CHECKOUT BTN}
    Wait Until Page Contains Element    ${table page}

Get The Table Data And Compare With The Info
    ${table data}    Create List
    ${table}    Get Webelements    ${table product info}
    FOR    ${i}    IN    @{table}
        ${text}    Get Text    ${i}
        Append To List    ${table data}    ${text}
    END
    ${table data}    Evaluate    sorted(${table data})
    Should Be Equal    ${info_list}    ${table data}

Click On Place Order
    Click Element    ${PLACE ORDER BTN}
    Wait Until Page Contains    Choose Country

Select Country
    Click Element    ${SELECT_COUNTRY}
    Click Element     ${IRAQ OPTION}
    Click Element    ${CHECKBOX}
    Click Element    ${PROCEED BTN}
    Wait Until Page Contains    Thank you