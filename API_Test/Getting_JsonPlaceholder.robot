*** Settings ***
Library    RequestsLibrary
Resource    Getting_JsonPlaceholder_Support.robot



*** Tasks ***
Getting Users on JsonPlaceholder Application
    [Documentation]    Using this test we can test JsonPlaceholder application
    [Tags]    Test02
    Payload with Valid Method, URI
    Payload with Invalid Method, Valid URI
    Payload with Valid Method without URI

