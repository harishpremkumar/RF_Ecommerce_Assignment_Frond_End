*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resource/Launch_Flipkart.robot
Resource    ../Resource/common.robot
Resource    ../Testcases/TC01_Support.robot



*** Keywords ***
I am on the Flipkart homepage
    Launch_Flipkart

I search for iPhone 15 Pro Black Titanium 128GB
    Search Product on Flipkart    Apple iPhone 15 Pro
    ${Link_Iphone_Flipkart}    Get Element Attribute    //div[text()="Apple iPhone 15 Pro (Black Titanium, 128 GB)"]/ancestor::a    href  
    Log    ${Link_Iphone_Flipkart}
    # Capture Page Screenshot
    Capture Element Screenshot    //div[text()="Apple iPhone 15 Pro (Black Titanium, 128 GB)"]/ancestor::a
    Sleep    4
    Go To    ${Link_Iphone_Flipkart}
    Wait Until Page Contains Element    //div[text()="Buy without Exchange"]/following-sibling::div    50
    ${Iphone_Amount_Flipkart}    Get Text    //div[text()="Buy without Exchange"]/following-sibling::div

    
    

    Set Global Variable    ${Iphone_Amount_Flipkart}

    

    

