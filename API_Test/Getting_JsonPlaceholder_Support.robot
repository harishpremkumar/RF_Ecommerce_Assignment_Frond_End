*** Settings ***
Variables    ../Data/url.py
Variables    ../Data/Test_Data.py
Resource    Getting_JsonPlaceholder.robot

Library    RPA.JSON

*** Keywords ***
Payload with Valid Method, URI
    Verify the status code should be 200 and Returned JSON includes fields: userId, id, title


Payload with Invalid Method, Valid URI
    Verify the status code should be 404

Payload with Valid Method without URI
    Verify the status code should be 404 and Response should be having json value

Verify the status code should be 200 and Returned JSON includes fields: userId, id, title
        Create Session    baseurl    ${API_BaseUrl}
        ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
        ${Get_Req}    Get Request    baseurl    uri=/posts/1    headers=${headers}    
        Status Should Be    200    ${Get_Req}
        ${Get_Req}    Set Variable    ${Get_Req.content}
        ${Json_Object}    Evaluate    json.loads($Get_Req)    json
        ${Title}    Get value from JSON    ${Json_Object}    $..title
        Should Contain Any    ${Title}    sunt aut facere

Verify the status code should be 404
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Get_Req}    POST Request    baseurl    uri=/posts/1    headers=${headers}    
    Status Should Be    404    ${Get_Req}               

Verify the status code should be 404 and Response should be having json value
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Get_Req}    POST Request    baseurl    uri=    headers=${headers}    
    Status Should Be    404    ${Get_Req}     