*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resource/Launch_Amazon.robot
Resource    ../Resource/common.robot


*** Keywords ***
I am on the Amazon homepage
    Launch_Amazon


I search for "iPhone 15 Pro Black Titanium 128GB"
    Search Product on Amazon    Apple iPhone 15 Pro

I select the first product from the search results
    ${Iphone_15pro_Black_Titanium_Link}    Get Element Attribute    (//span[contains(text(), 'Apple iPhone 15 Pro (128 GB) - Black Titanium')]/parent::a)[1]    href
    Log    ${Iphone_15pro_Black_Titanium_Link}
    Capture Page Screenshot

I navigate to the "Add to Cart" screen
    Wait Until Page Contains Element    (//button[@id="a-autoid-1-announce"])[1]    50
    Scroll Element Into View    (//button[@id="a-autoid-1-announce"])[1]
    Wait Until the Element is Present then Click the Element    (//button[@id="a-autoid-1-announce"])[1]
    Wait Until the Element is Present then Click the Element    ${BTN_Go_To_Cart}
    Sleep    10
    Capture Page Screenshot

I proceed to the "Buy Now" screen
    ${Iphone_Amount_Amazon}    Get Text    ${Text_Iphone_15pro_Black_Amount}
    ${value_without_commas} =  Evaluate  "${Iphone_Amount_Amazon.replace(',', '')}"  # Remove commas
    ${Iphone_Amount_Amazon}    Fetch From Left    ${value_without_commas}    marker=.
    
    
    Set Global Variable    ${Iphone_Amount_Amazon}

    

I should be directed to the payment gateway screen
    Wait Until the Element is Present then Click the Element    //span[@id="sc-buy-box-ptc-button"]
