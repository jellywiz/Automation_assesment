*** Settings ***
Resource    ../../Libraries/common.resource
Resource    ../../Resources/Keywords/general.resource

*** Test Cases ***
User Search For Brocolli And Orders It
    User Opens URL With Browser And Goes To The Site
    User Search For Brocolli
    User Selects 5 Quantity Of Brocolli
    Sleep    0.5s
    Get The Quantity Of The Product
    Click On The Add To Cart Button
    Click On The Cart Icon And Wait For The Cart Container
    Get The Info Of The Product In The Product Container
    Compare The Info Of The Product With The Container
    Go To Proceed Checkout
    Get The Table Data And Compare With The Info
    Click On Place Order
    Select Country

