*** Settings ***
Library    SeleniumLibrary

Documentation    Using this suite we can search specified product on Amazon Platform

Resource    TC01_Support.robot
Resource    TC02_Support.robot
Test Tags    Test



*** Test Cases ***
Purchase Product on Amazon
    [Documentation]    Using this test we can purchase iPhone 15 Pro Black Titanium 128GB
    [Tags]    Amazon
    Given I am on the Amazon homepage

    When I search for "iPhone 15 Pro Black Titanium 128GB"

    And I select the first product from the search results

    And I navigate to the "Add to Cart" screen

    And I proceed to the "Buy Now" screen

    Then I should be directed to the payment gateway screen

Purchase Product on Flipkart
    [Documentation]    Using this test we can purchase iPhone 15 Pro Black Titanium 128GB
    [Tags]    Flipkart
    Given I am on the Flipkart homepage

    When I search for iPhone 15 Pro Black Titanium 128GB

    And I select the first product from the search results

    # And I navigate to the Add to Cart screen

    # And I proceed to the Buy Now screen

    # Then I should be directed to the "payment gateway screen"

    ${Status}    Run Keyword And Return Status    Evaluate    ${Iphone_Amount_Flipkart} < ${Iphone_Amount_Amazon}
    
    IF    ${Status} == ${True}
        Log    The Amazon Iphone 15 Pro Price is high compare to flip kart    ${Iphone_Amount_Flipkart}
    ELSE
        Log    Flipkart Iphone 15 Pro Price is low compare to amazon ${Iphone_Amount_Flipkart}
    END
    
    