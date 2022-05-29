*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variables ***
${browser}  Chrome
${url}  http://127.0.0.1:8000/
${login-url}    http://127.0.0.1:8000/login
${register-url}    http://127.0.0.1:8000/registration
${books-url}    http://127.0.0.1:8000/books
${order-url}    http://127.0.0.1:8000/order/shipping/
${cart-url}    http://127.0.0.1:8000/cart/
${name}   tamara
${email}    tamara@finki.mk
${course}   team-project
${technique}    state-transition
${username}    taamarastanikevska
${password}    robot2022

*** Test Cases ***
OpenShoppingCartTest
    [Documentation]    Check if user is redirected to shopping cart page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    OpenShoppingCart
    ${current-url}=   Get Location
    should be equal    ${cart-url}    ${current-url}
    close all browsers
ContinueShoppingTest
    [Documentation]    Check if user is redirected to home page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    OpenShoppingCart
    ContinueToShop
    ${current-url}=   Get Location
    should be equal    ${url}    ${current-url}
    close all browsers
ProceedCheckoutWhenUserNotLoggedTest
    [Documentation]    Check if user is redirected to login page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${login-url}    ${current-url}
    close all browsers
LogInTest
    [Documentation]    Check if user is redirected to home page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    RegisterUser
    LogInUser
    ${current-url}=   Get Location
    should be equal    ${url}    ${current-url}
    close all browsers
ProceedCheckoutWhenUserLoggedTest
    [Documentation]    Check if user is redirected to order page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    RegisterUser
    LogInUser
    AddBookToCart
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${order-url}    ${current-url}
    close all browsers
ProceedCheckoutWhenCartEmptyTest
    [Documentation]    Check if user is redirected to books page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    RegisterUser
    LogInUser
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${books-url}    ${current-url}
    close all browsers
ProceedCheckoutWhenCartNotEmptyTest
    [Documentation]    Check if user is redirected to order page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    RegisterUser
    LogInUser
    AddBookToCart
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${order-url}    ${current-url}
    close all browsers


*** Keywords ***
CreateDriver
    create webdriver    ${browser}  executable_path=chromedriver.exe
OpenApp
    open browser    ${url}   ${browser}
LogInUser
    open browser    ${login-url}   ${browser}
    input text    id:id_username    ${username}
    input text    id:id_password    ${password}
    submit form    id:loginForm
RegisterUser
    open browser    ${register-url}   ${browser}
    input text    id:id_name    ${name}
    input text    id:id_email    ${email}
    input text    id:id_username    ${username}
    input text    id:id_password1    ${password}
    input text    id:id_password2    ${password}
    submit form    id:registerForm
OpenShoppingCart
    click element    id:shoppingCart
AddBookToCart
    click element    id:addTocart
ContinueToShop
    click element    link:Continue to Shop
ProceedToCheckout
    click element    link:Proceed to Checkout