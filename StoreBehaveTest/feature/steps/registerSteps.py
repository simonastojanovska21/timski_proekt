from behave import *
from behave_webdriver.steps import *


@given('I am logged in to the system')
def loginUser(context):
    context.behave_driver.open_url('http://127.0.0.1:8000/login')
    elementUsername = context.behave_driver.get_element('#id_username')
    elementUsername.send_keys('admin@admin.com')
    elementPassword = context.behave_driver.get_element('#id_password')
    elementPassword.send_keys('P@ssword1')
    context.behave_driver.submit('#loginForm')


@then('I expect that element "{id}" is required')
def step_impl(context, id):
    elem = context.behave_driver.get_element(id)
    assert elem.get_attribute('required')