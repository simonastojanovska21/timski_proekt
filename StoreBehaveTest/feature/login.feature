# Created by Simona
Feature: Logging user
  Online book shop enables user to login to the system

  Scenario Outline: User is on the login page and sees username and password field
    Given I open the url "http://127.0.0.1:8000/login"
    Then I expect that element "<id>" is visible
    Examples: Elements id
    |id          |
    |#id_username|
    |#id_password|

  Scenario: User is on the login page and enters the data for successful registration
    Given I open the url "http://127.0.0.1:8000/login"
    When I add "admin@admin.com" to the inputfield "#id_username"
    And I add "P@ssword1" to the inputfield "#id_password"
    And I submit the form "#loginForm"
    Then I expect that the url is "http://127.0.0.1:8000/"

  Scenario: User is already logged in and tries to login again
    Given I am logged in to the system
    When I open the url "http://127.0.0.1:8000/login"
    Then I expect that the url is "http://127.0.0.1:8000/"

  Scenario: User tries to login with wrong username
    Given I open the url "http://127.0.0.1:8000/login"
    When I add "test@admin.com" to the inputfield "#id_username"
    And I add "P@ssword1" to the inputfield "#id_password"
    And I submit the form "#loginForm"
    Then I expect that the url is "http://127.0.0.1:8000/login"

  Scenario: User tries to login with wrong password
    Given I open the url "http://127.0.0.1:8000/login"
    When I add "admin@admin.com" to the inputfield "#id_username"
    And I add "P@assword1" to the inputfield "#id_password"
    And I submit the form "#loginForm"
    Then I expect that the url is "http://127.0.0.1:8000/login"

  Scenario: User is on the register page and navigates to login page
    Given I open the url "http://127.0.0.1:8000/registration"
    When I click on the element "#signIn"
    Then I expect that the url is "http://127.0.0.1:8000/login"

  Scenario: Each field in the login form should be required
    Given I open the url "http://127.0.0.1:8000/login"
    Then I expect that element "#id_username" is required
    And I expect that element "#id_password" is required

  Scenario: User should be able to logout from the system
    Given I am logged in to the system
    When I open the url "http://127.0.0.1:8000/logout"
    Then I expect that the url is "http://127.0.0.1:8000/"