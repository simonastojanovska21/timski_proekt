# Created by Simona 3 scenarios
Feature: Details about a book
  User can view the details about a book

  Scenario:For each author there should be displayed his image, name and short biography
    Given I open the url "http://127.0.0.1:8000/writer/6"
    Then I expect that element "#writer_image" is visible
    And I expect that element ".bookName" is visible
    And I expect that element ".biography" is visible

  Scenario: User should access the details page from homepage
    Given I open the url "http://127.0.0.1:8000/"
    When I click on the element ".book-21 a:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/writer/15"

  Scenario: User should access the details page from categories page
    Given I open the url "http://127.0.0.1:8000/category/2"
    When I click on the element ".book-5 a:nth-child(3)"
    Then I expect that the url is "http://127.0.0.1:8000/writer/18"
