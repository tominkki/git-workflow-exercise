***Settings***
Documentation   Register new account and sign out.
Library         SeleniumLibrary

***Variables***
${URL}          http://automationpractice.com/index.php
${BROWSER}      Chrome

${EMAIL}        dummy22.user@test.com
${FIRST_NAME}   Dummy
${LAST_NAME}    User
${PASSWORD}     dummy123
@{BIRTHDAY}     14  11  1901

@{PERSONAL_INFO}    ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${BIRTHDAY}

${STREET}       Teiskontie
${CITY}         Tampere
${STATE}        Oregon
${ZIP}          33100
${PHONE}        1234567890

@{ADDRESS}      ${STREET}   ${CITY}     ${STATE}    ${ZIP}      ${PHONE}


***Test Cases***
Navigate To Registration Form
    Open Browser To Index Page
    Click Sign In Button
    Input Email For Registration  ${EMAIL}
    Click Create An Account Button
    
Fill Registration Form
    Fill Your Personal Information  ${PERSONAL_INFO}
    Fill Your Address               ${ADDRESS}

Submit Form And Finish Registration
    Click Register Button

Sign Out After Registration
    Click Sign Out Button
    [Teardown]  Close Browser


***Keywords***
Open Browser To Index Page
    Open Browser            ${URL}  ${BROWSER}
    Title Should Be         My Store
    Page Should Contain     Automation Practice Website
    
Click Sign In Button
    Click Element               xpath: //*[contains(text(), "Sign in")]
    Wait Until Page Contains    Authentication

Input Email For Registration
    [Arguments]     ${EMAIL}
    Input Text                  id:email_create     ${EMAIL}

Click Create An Account Button
    Click Element               id:SubmitCreate
    Wait Until Page Contains    Your personal information

Fill Your Personal Information
    [Arguments]     ${args}

    Click Element               id:id_gender1
    Input Text                  id:customer_firstname       ${args[0]}
    Input Text                  id:customer_lastname        ${args[1]}
    Input Text                  id:passwd                   ${args[2]}
    Select From List By Value   id:days                     ${args[3][0]}
    Select From List By Value   id:months                   ${args[3][1]}
    Select From List By Value   id:years                    ${args[3][2]}

Fill Your Address
    [Arguments]     ${args}
    Input Text                  id:address1                 ${args[0]}
    Input Text                  id:city                     ${args[1]}
    Select From List By Label   id:id_state                 ${args[2]}
    Input Text                  id:postcode                 ${args[3]}
    Input Text                  id:phone_mobile             ${args[4]}

Click Register Button
    Click Element               id:submitAccount
    Wait Until Page Contains    Welcome to your account.

Click Sign Out Button
    Click Element               xpath: //*[contains(text(), "Sign out")]
    Wait Until Page Contains    Authentication
