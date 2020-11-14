***Settings***
Documentation   Dummy test for testing project is correctly set up.
Library         SeleniumLibrary

***Variables***
${URL}          http://automationpractice.com/index.php
${BROWSER}      Chrome

***Test Cases***
Browser can be opened
    Open Browser To Index Page
    [Teardown]  Close Browser

***Keywords***
Open Browser To Index Page
    Open Browser            ${URL}  ${BROWSER}
    Title Should Be         My Store
    Page Should Contain     Automation Practice Website
    