*** Settings ***
Library    RequestsLibrary
Resource    Creating_JsonPlaceholder_Support.robot


*** Test Cases ***
Creating Users on JsonPlaceholder
    [Tags]    Test02
    Payload with valid Method, URI
    Payload With Delete Method, Valid URI
    Payload With valid Method, Without URI
    

