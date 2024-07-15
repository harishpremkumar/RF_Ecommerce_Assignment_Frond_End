*** Settings ***
Library    RequestsLibrary
Resource    Updating_User_Support.robot


*** Test Cases ***
Updating Users on JsonPlaceholder
    [Tags]    Test03
    Payload With Valid Method, URI
    Payload With valid Method, Without URI
    Payload with Post Method, Valid URI
    Invalid Payload as well as Invalid Method, URI
    


