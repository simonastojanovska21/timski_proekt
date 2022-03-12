# Created by Simona 19 scenarios
Feature: Registering new user
  Online book shop enables user to register

  Scenario Outline: User is on the register page and sees name, email, username, password, repeat password field
    Given I open the url "http://127.0.0.1:8000/registration"
    Then I expect that element "<id>" is visible
    Examples: Elements id
    |id           |
    |#id_name     |
    |#id_email    |
    |#id_username |
    |#id_password1|
    |#id_password2|
    |#registerForm input[type=text]|

  Scenario: User is on the register page and enters the data for successful registration
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "test@test.com" to the inputfield "#id_email"
    And I add "test@test.com" to the inputfield "#id_username"
    And I add "P@ssword1" to the inputfield "#id_password1"
    And I add "P@ssword1" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that the url is "http://127.0.0.1:8000/"
    Then I open the url "http://127.0.0.1:8000/logout"
    
  Scenario: Logged in user tries to register
    Given I am logged in to the system
    When I open the url "http://127.0.0.1:8000/registration"
    Then I expect that the url is "http://127.0.0.1:8000/"
    And I open the url "http://127.0.0.1:8000/logout"

  Scenario: User tries to register with existing username
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "admin@admin.com" to the inputfield "#id_email"
    And I add "admin@admin.com" to the inputfield "#id_username"
    And I add "P@ssword1" to the inputfield "#id_password1"
    And I add "P@ssword1" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that element ".errorlist" is visible
    And I expect that element ".errorlist" contains the text "A user with that username already exists."
    
  Scenario: User tries to access register page from login page
    Given I open the url "http://127.0.0.1:8000/login"
    When I click on the element "#signUp"
    Then I expect that the url is "http://127.0.0.1:8000/registration"

  Scenario Outline: Each field in the register form should be required
    Given I open the url "http://127.0.0.1:8000/registration"
    Then I expect that element "<id>" is required
    Examples: Elements id
    |id           |
    |#id_name     |
    |#id_email    |
    |#id_username |
    |#id_password1|
    |#id_password2|

  Scenario: User tries to register with different passwords
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "test1@test.com" to the inputfield "#id_email"
    And I add "test1@test.com" to the inputfield "#id_username"
    And I add "P@ssword1" to the inputfield "#id_password1"
    And I add "P@ssword" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that element ".errorlist" is visible
    And I expect that element ".errorlist" contains the text "The two password fields didn’t match."

  Scenario: User tries to register with password similar to the username
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "test1@test.com" to the inputfield "#id_email"
    And I add "test1@test.com" to the inputfield "#id_username"
    And I add "testtest1" to the inputfield "#id_password1"
    And I add "testtest1" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that element ".errorlist" is visible
    And I expect that element ".errorlist" contains the text "The password is too similar to the username."

  Scenario: User tries to register with password that has less than 8 characters
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "test1@test.com" to the inputfield "#id_email"
    And I add "test1@test.com" to the inputfield "#id_username"
    And I add "pass1" to the inputfield "#id_password1"
    And I add "pass1" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that element ".errorlist" is visible
    And I expect that element ".errorlist" contains the text "This password is too short. It must contain at least 8 characters."

  Scenario: User tries to register with password that is entirely numeric
    Given I open the url "http://127.0.0.1:8000/registration"
    When I add "Test name" to the inputfield "#id_name"
    And I add "test1@test.com" to the inputfield "#id_email"
    And I add "test1@test.com" to the inputfield "#id_username"
    And I add "123456789" to the inputfield "#id_password1"
    And I add "123456789" to the inputfield "#id_password2"
    And I submit the form "#registerForm"
    Then I expect that element ".errorlist" is visible
    And I expect that element ".errorlist" contains the text "This password is entirely numeric."