*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

Two Times
    [Tags]  72954
    Double Click Element   xpath=//a[contains(.,"Click Me 2x")]
    