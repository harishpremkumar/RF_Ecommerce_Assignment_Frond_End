*** Settings ***
Resource    Updating_User.robot
Variables    ../Data/Test_Data.py
Variables    ../Data/url.py

Library    RPA.JSON

*** Keywords ***
Payload With Valid Method, URI
    Verify The User should be updated and status code should be 200

Payload With valid Method, Without URI
    "Verify The User shouldn't be updated and status code should be 404"

Payload with Post Method, Valid URI
    Verify The User shouldn't be updated and status code should be 404 

Invalid Payload as well as Invalid Method, URI
    Verify a status code should be 404 The User shouldn't be updated

Verify The User should be updated and status code should be 200
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Payload}    Create Dictionary    id=1    title=foo    body=bar    userId=1 
    ${Put_Req}    Put Request    baseurl    uri=/posts/1    headers=${headers}    data=${Payload}
    Status Should Be    200    ${Put_Req}
    ${Put_Req}    Set Variable    ${Put_Req.content}
    ${Json_Object}    Evaluate    json.loads($Put_Req)    json
    ${Title}    Get value from JSON    ${Json_Object}    $.title  
    Should Be Equal As Strings    ${Title}    foo

"Verify The User shouldn't be updated and status code should be 404"
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Payload}    Create Dictionary    id=1    title=foo    body=bar    userId=1 
    ${Put_Req}    Put Request    baseurl    uri=    headers=${headers}    data=${Payload}
    Status Should Be    404    ${Put_Req}
    
    

Verify The User shouldn't be updated and status code should be 404
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Payload}    Create Dictionary    id=1    title=foo    body=bar    userId=1 
    ${Put_Req}    Delete Request    baseurl    uri=/posts/1    headers=${headers}    data=${Payload}
    Status Should Be    200    ${Put_Req}


Verify a status code should be 404 The User shouldn't be updated
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${Payload}    Create Dictionary    id=abcd    title=abcd    body=abcd    userId=abcd 
    ${Put_Req}    Post Request    baseurl    uri=/posts/1    headers=${headers}    data=${Payload}
    Status Should Be    404    ${Put_Req}
    