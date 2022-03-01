from behave import *
from behave_webdriver.steps import *


@then('I expect the book "{book}" to be shown')
def seeListOfBooks(context, book):
    assert context.behave_driver.element_visible('.book-' + book)


@then('I expect the category "{category}" to be shown')
def seeListOfCategories(context, category):
    assert context.behave_driver.element_visible('.category-' + category)