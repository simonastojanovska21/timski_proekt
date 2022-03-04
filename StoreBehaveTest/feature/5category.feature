# Created by Simona at 4 scenarios
Feature: Filtering books by category
  User can filter books based on the category they belong to

  Scenario Outline: User clicks on the category Sci-Fi & Fantasy and should see list of 3 books
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the element ".category-2"
    Then I expect that the url is "http://127.0.0.1:8000/category/2"
    And I expect the book "<book>" to be shown
    Examples: Books
    |book|
    |5   |
    |6   |
    |13  |

  Scenario: User tries to access category that does not exist
    Given I open the url "http://127.0.0.1:8000/category/25"
    Then I expect that element "#noBooks" contains the text "There are no books Found."