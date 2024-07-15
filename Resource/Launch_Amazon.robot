*** Settings ***
Library    SeleniumLibrary
Variables    ../Data/Test_Data.py
Variables    ../Data/url.py
Variables    ../Data/Xpath.py

*** Keywords ***
Launch_Amazon
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    # Call Method    ${options}    add_argument    --disable-dev-shm-usage
    # Call Method    ${options}    add_argument    --no-sandbox
    # Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --incognito
    # Call Method    ${options}    add_argument    --headless
    Open Browser    url=${Amazon_url}    browser=${browser}    options=${options}
    Maximize Browser Window
    