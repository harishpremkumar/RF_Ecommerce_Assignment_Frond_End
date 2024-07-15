*** Settings ***
Library    SeleniumLibrary
Variables    ../Data/Test_Data.py
Variables    ../Data/Xpath.py



*** Keywords ***
Wait Until the Element is Present then Click the Element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    50
    Wait Until Keyword Succeeds    9    9    Click Element    ${element}


Search Product on Amazon
    [Arguments]    ${name}
    Input Text    ${Input_Search_Amazon}    ${name}
    Press Keys    None    ENTER
    Wait Until Page Contains Element    //*[contains(text(), 'Apple iPhone 15 Pro (128 GB) - Black Titanium')]/ancestor::div[@class="puisg-row"]    50

Search Product on Flipkart
    [Arguments]    ${name}
    Wait Until Page Contains Element    //input[@title="Search for Products, Brands and More"]    50
    Input Text    //input[@title="Search for Products, Brands and More"]    ${name}    
    Press Keys    None    ENTER