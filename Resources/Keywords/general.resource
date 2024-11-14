*** Settings ***
Resource    ../../Libraries/common.resource
Resource    ../Variables/domain_environemts.resource
Resource    ../Keywords/search.resource
Resource    ../Keywords/products.resource

*** Keywords ***
#This is how to open the url
User Opens URL With Browser And Goes To The Site
    Open Browser    url=${URL}    browser=${BROWSER}
    Set Log Level    TRACE
    Set Selenium Timeout    20s
    Maximize Browser Window

#This is how to search for a product
User Search For Brocolli
    Search Result    Brocolli
    Checking The Product To Be One

#This is how to select the quantity of a product
User Selects 5 Quantity Of Brocolli
    ${quantity_of_product}    Set Variable    5
    Quantity Input For The Product    ${quantity_of_product}
    Set Test Variable    ${quantity_of_product}