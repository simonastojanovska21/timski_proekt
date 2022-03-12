# Created by Simona 6 scenarios
Feature: Details about a book
  User can view the details about a book

  Scenario:For each book there should be displayed cover page, title, author, description, price and add to shopping cart
    Given I open the url "http://127.0.0.1:8000/book/1"
    Then I expect that element "#product_image" is visible
    And I expect that element ".bookTitle" is visible
    And I expect that element ".author" is visible
    And I expect that element ".product-information article" is visible
    And I expect that element ".pricebox p" is visible
    And I expect that element "#addTocart" is visible

  Scenario: User should be able to click on the add to shopping cart button
    Given I open the url "http://127.0.0.1:8000/book/1"
    When I click on the element "#addTocart"
    Then I expect that there are "3" items in the shopping cart

  Scenario: User should be able to click on the author name and be redirected to the page
    Given I open the url "http://127.0.0.1:8000/book/1"
    When I click on the element ".author"
    Then I expect that the url is "http://127.0.0.1:8000/writer/6"

  Scenario: User should access the details page from homepage
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the element ".book-21 a:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/book/21"

  Scenario: User should access the details page from categories page
    Given I open the url "http://127.0.0.1:8000/category/1"
    When I click on the element ".book-1 a:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/book/1"

  Scenario: User tries to access book details page with invalid id
    Given I open the url "http://127.0.0.1:8000/book/55"
    Then I expect that element ".exception_value" contains the text "No Book matches the given query."
