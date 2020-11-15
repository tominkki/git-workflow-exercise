***Settings***
Documentation   Register new account and sign out.
Library         SeleniumLibrary

***Variables***
${URL}          http://automationpractice.com/index.php
${BROWSER}      Chrome

${EMAIL}        dummy.user@test.com
${FIRST_NAME}   Dummy
${LAST_NAME}    User
${PASSWORD}     dummy123
${BIRTHDAY}     14  11  1901

${PERSONAL_INFO}=   Create Dictionary   email=${EMAIL} fname=${FIRST_NAME} lname=${LAST_NAME} pwd=${PASSWORD} bday=${BIRTHDAY}

${STREET}       Teiskontie
${CITY}         Tampere
${STATE}        Oregon
${ZIP}          33100
${PHONE}        1234567890

${ADDRESS}=     Create Dictionary   street=${STREET} city=${CITY} state=${STATE} zip=${ZIP} phone=${PHONE}

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


***Keywords***
Open Browser To Index Page
    Open Browser            ${URL}  ${BROWSER}
    Title Should Be         My Store
    Page Should Contain     Automation Practice Website
    
Click Sign In Button
    Click Element           xpath: //*[contains(text(), "Sign in")]
    Page Should Contain     AUTHENTICATION

Input Email For Registration
    [Arguments]     ${EMAIL}
    Input Text              id:email_create     ${EMAIL}

Click Create An Account Button
    Click Element           id:SubmitCreate
    Page Should Contain     YOUR PERSONAL INFORMATION

Fill Your Personal Information
    [Arguments]     ${args}
    Click Element               id:uniform-id_gender1
    Input Text                  id:customer_firstname       ${args['fname']}
    Input Text                  id:customer_lastname        ${args['lname']}
    Input Text                  id:passwd                   ${args['pwd']}
    Select From List By Value   id:days                     ${args['bday'][0]}
    Select From List By Value   id:months                   ${args['bday'][1]}
    Select From List By Value   id:years                    ${args['bday'][2]}

Fill Your Address
    [Arguments]     ${args}
    Input Text                  id:address1                 ${args['street']}
    Input Text                  id:city                     ${args['city']}
    Select From List By Label   id:id_state                 ${args['state']}
    Input Text                  id:postcode                 ${args['zip']}
    Input Text                  id:phone_mobile             ${args['phone']}

Click Register Button
    Click Element               id:submitAccount
    Page Should Contain         Welcome to your account.