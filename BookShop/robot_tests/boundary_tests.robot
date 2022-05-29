*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  Chrome
${url}  http://127.0.0.1:8000/
${course}   team-project
${technique}    boundary
${name}    tamara

*** Test Cases ***
CartQuantityBoundaryTest
    [Documentation]    Check how the app behaves when user tries to decrease the amount of books in cart when there is only one book in the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    OpenShoppingCart
    ClickMinus
    ${qty}=    GetBookQuantityInCart
    should be equal    ${qty}    1
    Close all browsers

*** Keywords ***
CreateDriver
    create webdriver    ${browser}  executable_path=chromedriver.exe
OpenApp
    open browser    ${url}   ${browser}
OpenShoppingCart
    click element    id:shoppingCart
AddBookToCart
    click element    id:addTocart
GetBookQuantityInCart
    ${qty}=    get element attribute    name:qty    value
    [return]    ${qty}
ClickPlus
    click button    css:body > div.container-fluid > div > div > div > div > div > table > tbody > tr > td.cart_quantity > div > span.input-group-btn.input-group-append > button
ClickMinus
    click button    css:body > div.container-fluid > div > div > div > div > div > table > tbody > tr > td.cart_quantity > div > span.input-group-btn.input-group-prepend > button
