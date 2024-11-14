*** Settings ***
Resource    ../../Libraries/common.resource
Resource    ../Variables/domain_environemts.resource
Resource    ../Locators/input.resource
Resource    ../Locators/containers.resource

*** Keywords ***
Search Result
    [Arguments]    ${search input}
    Input Text    ${search_input_path}    ${search input}

Checking The Product To Be One
    ${Count Of Products}    Get Webelements    ${PRODUCTS}
    ${Count Of Products}    Get Length    ${Count Of Products}
    Wait Until Page Does Not Contain Element    //div[2][@class='product']
    Should Be Equal As Numbers    ${Count Of Products}    1