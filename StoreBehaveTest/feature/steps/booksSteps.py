from behave import *
from behave_webdriver.steps import *


@then('I expect that there are "{numItems}" items in the shopping cart')
def countItemsInShoppingCart(context, numItems):
    context.behave_driver.pause(1000)
    elem = context.behave_driver.get_element_text('#gettotalcart')
    assert (elem == numItems)
