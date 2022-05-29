*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variables ***
${browser}  Chrome
${url}  http://127.0.0.1:8000/
${course}   team-project
${technique}    end-user
${name}    tamara
${num}    2

*** Test Cases ***
HomePageShouldContainCartButtonTest
    [Documentation]    Check if the HomePage has cart button
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    HasCartButton
    Close all browsers
AddToCartFromHomePageTest
    [Documentation]    Check if the user can successfully add book to cart from HomePage
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    Wait
    OpenShoppingCart
    HasBookInCart
    Close all browsers
AddToCartFromDetailsPageTest
    [Documentation]    Check if the user can successfully add book to cart from DetailsPage
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    OpenDetailsPageForBook
    AddBookToCart
    Wait
    OpenShoppingCart
    HasBookInCart
    Close all browsers
ShowCartQtyOnHomePageTest
    [Documentation]    Check if the user can see how many books are in the shopping cart on the HomePage
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    Wait
    ${qty}=    GetTotalInCart
    should be equal    ${qty}    1
    close all browsers
ShowBookQtyInCartTest
    [Documentation]    Check if the user can see the quantity for each book in the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    OpenShoppingCart
    Wait
    ${qty}=    GetBookQuantityInCart
    should be equal    ${qty}    1
    close all browsers
ShowBookSumInCartTest OneItem
    [Documentation]    Check if the user can see the price for each book in the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    ${book-price}=    GetBookPrice
    OpenShoppingCart
    Wait
    ${sum}=    get text    id:22
    should be equal    ${book-price}    ${sum}
    close all browsers
ShowBookSumInCartTest
    [Documentation]    Check if the user can see the total price for each book in the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    AddBookToCart
    ${book-price-str}=    GetBookPrice
    ${str1}=    split string    ${book-price-str}
    ${price}=    get from list    ${str1}  0
    ${book-price-int}=    convert to integer    ${price}
    ${expected}=    evaluate    int(${num})*int(${book-price-int})
    Wait
    OpenShoppingCart
    Wait
    ${sum-str}=    get text    id:22
    ${str2}=    split string    ${sum-str}
    ${sum}=    get from list    ${str2}  0
    ${sum-int}=    convert to integer    ${sum}
    should be equal as numbers    ${expected}    ${sum-int}
    close all browsers
DeleteBookFromCartTest
    [Documentation]    Check if the user can delete book from the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    OpenShoppingCart
    DeleteBook
    CartIsEmpty
    close all browsers
IncreaseBookQtyInCartTest
    [Documentation]    Check if the user can increase the amount of a book from the cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    OpenShoppingCart
    ClickPlus
    ${qty}=    GetBookQuantityInCart
    should be equal    ${qty}    2
    close all browsers
DecreaseBookQtyInCartTest
    [Documentation]    Check if the user can decrease the amount of a book from cart
    [Tags]    ${technique}    ${name}     ${course}
    CreateDriver
    OpenApp
    AddBookToCart
    AddBookToCart
    OpenShoppingCart
    ClickMinus
    ${qty}=    GetBookQuantityInCart
    should be equal    ${qty}    1
    close all browsers


*** Keywords ***
CreateDriver
    create webdriver    ${browser}  executable_path=chromedriver.exe
OpenApp
    open browser    ${url}   ${browser}
OpenShoppingCart
    click element    id:shoppingCart
OpenDetailsPageForBook
    click element    link:Long Walk to Freedom
AddBookToCart
    click element    id:addTocart
GetBookPrice
    ${book-price}=    get text    id:bookPrice
    [return]    ${book-price}
GetTotalInCart
    ${qty}=    get text    id:gettotalcart
    [return]    ${qty}
HasBookInCart
    page should contain element    id:22
CartIsEmpty
    page should not contain element    id:22
GetBookQuantityInCart
    ${qty}=    get element attribute    name:qty    value
    [return]    ${qty}
DeleteBook
    click element    id:deleteBook
ClickPlus
    click button    css:body > div.container-fluid > div > div > div > div > div > table > tbody > tr > td.cart_quantity > div > span.input-group-btn.input-group-append > button
ClickMinus
    click button    css:body > div.container-fluid > div > div > div > div > div > table > tbody > tr > td.cart_quantity > div > span.input-group-btn.input-group-prepend > button
HasCartButton
    page should contain element    id:shoppingCart
Wait
    sleep   1
