# Created by Simona 35 scenarios
Feature: Home page of the web application
  After starting of the application there should be displayed a list of 15 most recent books

  Scenario Outline: User opens the home page
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect the book "<book>" to be shown
    Examples: Books
    |book|
    |22  |
    |21  |
    |20  |
    |19  |
    |18  |
    |17  |
    |16  |
    |15  |
    |14  |
    |13  |
    |11  |
    |9   |
    |8   |
    |7   |
    |6   |

  Scenario Outline: User should see all 10 categories on the home page
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect the category "<category>" to be shown
    Examples: Categories
    |category|
    |1       |
    |2       |
    |3       |
    |4       |
    |5       |
    |6       |
    |7       |
    |8       |
    |9       |
    |11      |

  Scenario: User clicks on Computer Science category
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the element ".category-1"
    Then I expect that the url is "http://127.0.0.1:8000/category/1"

  Scenario: User should see search bar on the home page
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect that element ".input-group.search_box" is visible

  Scenario: User searches for a book
    Given I open the url "http://127.0.0.1:8000/"
    When I set "python" to the inputfield ".input-group.search_box input"
    And I click on the button ".input-group.search_box button"
    Then I expect that the url is "http://127.0.0.1:8000/search/?q=python"

  Scenario: User should see shopping cart button on the home page
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect that element "#shoppingCart" is visible

  Scenario: User clicks on the shopping cart button
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the button "#shoppingCart"
    Then I expect that the url is "http://127.0.0.1:8000/cart/"

  Scenario: User should see all books button
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect that element "#books" is visible

  Scenario: User clicks on all books button
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the button "#books"
    Then I expect that the url is "http://127.0.0.1:8000/books"

  Scenario: User should see login button
    Given I open the url "http://127.0.0.1:8000/"
    Then I expect that element "#login" is visible

  Scenario: User clicks the login button
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the button "#login"
    Then I expect that the url is "http://127.0.0.1:8000/login"

  Scenario: User navigates to home page from another page, eg.books page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".logo"
    Then I expect that the url is "http://127.0.0.1:8000/"