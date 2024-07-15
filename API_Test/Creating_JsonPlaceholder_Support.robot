*** Settings ***
Resource    Creating_JsonPlaceholder.robot
Variables    ../Data/url.py
Variables    ../Data/Test_Data.py
Library    RPA.JSON

*** Keywords ***
Payload with valid Method, URI
    Verify User should be created and status should be 200 and The Response should be returned

Payload With Delete Method, Valid URI
    Verify User shouldn't be created and status should be 404

Payload With valid Method, Without URI
    "Verify User shouldn't be created and status should be 404"


Verify User should be created and status should be 200 and The Response should be returned
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8  
    ${Post_Req}    POST Request    baseurl    uri=/posts    headers=${headers} 
    Status Should Be    201    ${Post_Req}
    ${Post_Req}    Set Variable    ${Post_Req.content}
    ${Json_Object}    Evaluate    json.loads($Post_Req)    json
    ${Title}    Get value from JSON    ${Json_Object}    $..id  
    Should Be Equal As Integers    ${Title}    101      

Verify User shouldn't be created and status should be 404
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8   
    ${Post_Req}    Delete Request    baseurl    uri=/posts    headers=${headers} 
    Status Should Be    404    ${Post_Req}

"Verify User shouldn't be created and status should be 404"
    Create Session    baseurl    ${API_BaseUrl}
    ${headers}    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8    
    ${Post_Req}    Delete Request    baseurl    uri=    headers=${headers} 
    Status Should Be    404    ${Post_Req}        
    
