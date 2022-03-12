# Created by Simona 34 scenarios
Feature: List of books
  Online book shop enables user to browse through the available books

  Scenario: User should see pagination element
    Given I open the url "http://127.0.0.1:8000/books"
    Then I expect that element ".d-pagination" is visible

  Scenario: User should be able to navigate between pages, from 1 page to 2 page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".pagination li:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=2"

  Scenario: User should be able to navigate between pages, from 1 page to next page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".pagination li:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=2"

  Scenario: User should be able to navigate between pages, from 1 page to last page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".pagination li:nth-child(4)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=2"

  Scenario: User should be able to navigate between pages, from 2 page to 1 page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".pagination li:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=1"

  Scenario: User should be able to navigate between pages, from 2 page to previous page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".pagination li:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=1"

  Scenario: User should be able to navigate between pages, from 2 page to first page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".pagination li:nth-child(1)"
    Then I expect that the url is "http://127.0.0.1:8000/books?page=1"

  Scenario Outline: User should see list of 10 books on the first page
    Given I open the url "http://127.0.0.1:8000/books"
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

  Scenario Outline: User should see list of 9 books on the second page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    Then I expect the book "<book>" to be shown
    Examples: Books
    |book|
    |11  |
    |9   |
    |8   |
    |7   |
    |6   |
    |5   |
    |4   |
    |2   |
    |1   |

  Scenario: For each book on the page there should be displayed image, book name, author, price, add to shopping cart button
    Given I open the url "http://127.0.0.1:8000/books"
    Then I expect that element ".book-22 .coverpage img" is visible
    And I expect that element ".book-22 a:nth-child(2)" is visible
    And I expect that element ".book-22 a:nth-child(3)" is visible
    And I expect that element ".book-22 p" is visible
    And I expect that element ".book-22 .btn.btn-warning" is visible

  Scenario: For each book on the second page there should be displayed image, book name, author, price, add to shopping cart button
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    Then I expect that element ".book-1 .coverpage img" is visible
    And I expect that element ".book-1 a:nth-child(2)" is visible
    And I expect that element ".book-1 a:nth-child(3)" is visible
    And I expect that element ".book-1 p" is visible
    And I expect that element ".book-1 .btn.btn-warning" is visible

  Scenario: User should click on the book name from first page and be redirected to details page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".book-22 a:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/book/22"

  Scenario: User should click on the author from first page and be redirected to details page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".book-22 a:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/writer/16"

  Scenario: User should be able to click on shopping cart button for one book from first page
    Given I open the url "http://127.0.0.1:8000/books"
    When I click on the element ".book-22 #addTocart"
    Then I expect that there are "1" items in the shopping cart

  Scenario: User should click on the book name from second page and be redirected to details page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".book-1 a:nth-child(2)"
    Then I expect that the url is "http://127.0.0.1:8000/book/1"

  Scenario: User should click on the author from second page and be redirected to details page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".book-1 a:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/writer/6"

  Scenario: User should be able to click on shopping cart button for one book from second page
    Given I open the url "http://127.0.0.1:8000/books?page=2"
    When I click on the element ".book-1 #addTocart"
    Then I expect that there are "2" items in the shopping cart