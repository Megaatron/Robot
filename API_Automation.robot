*** Settings ***

Library    RequestsLibrary

*** Variables ***

${Base_URL}    http://thetestingworldapi.com/


*** Test Cases ***

Verify the response code is "200"

    Create Session    Get_Student_Details    ${Base_URL}
    ${response}    get request    Get_Student_Details    api/studentsDetails
    ${response_code}  convert to string    ${response.status_code}
    log to console    ${response_code}
    should be equal    ${response_code}  200