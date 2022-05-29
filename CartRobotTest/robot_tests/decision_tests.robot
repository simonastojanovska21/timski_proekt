*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  Chrome
${url}  http://127.0.0.1:8000/
${login-url}    http://127.0.0.1:8000/login
${register-url}    http://127.0.0.1:8000/registration
${books-url}    http://127.0.0.1:8000/books
${order-url}    http://127.0.0.1:8000/order/shipping/
${name}   tamara
${email}    tamara@finki.mk
${course}   team-project
${technique}    decision
${username}    taamarastanikevska
${password}    robot2022

*** Test Cases ***
ProceedCheckoutTest When UserNotLogged And CartEmpty
    [Documentation]    Check if user is redirected to login page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${login-url}    ${current-url}
    close all browsers
ProceedCheckoutTest When UserNotLogged And CartNotEmpty
    [Documentation]    Check if user is redirected to login page
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    OpenShoppingCart
    ProceedToCheckout
    ${current-url}=   Get Location
    should be equal    ${login-url}    ${current-url}
    close all browsers
ProceedCheckoutTest When UserLogged And CartEmpty
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
ProceedCheckoutTest When UserLogged And CartNotEmpty
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
ProceedToCheckout
    click element    link:Proceed to Checkout