import behave_webdriver


def before_all(context):
    context.behave_driver = behave_webdriver.Chrome.headless()
    context.behave_driver.fullscreen_window()



def after_all(context):
    # cleanup after tests run
    context.behave_driver.quit()
