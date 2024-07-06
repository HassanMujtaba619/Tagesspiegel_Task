*** Settings ***
Library           SeleniumLibrary
Library           RPA.Email.ImapSmtp
Library           Collections

*** Variables ***
${EMAIL}          testautomationtagesspiegel@gmail.com
${PASSWORD}       YourSecurePassword
${IMAP_SERVER}    imap.gmail.com
${SMTP_SERVER}    smtp.gmail.com
${EMAIL_FOLDER}   inbox

*** Keywords ***
Open Tagesspiegel Website
    [Arguments]    ${environment}
    Open Browser    https://${environment}    chrome
    Maximize Browser Window

Click Anmelden Link
    Click Link    xpath=//a[contains(@href, 'login')]

Choose Registrieren Tab
    Click Element    xpath=//a[contains(@href, 'register')]

Fill Registration Form
    ${random_email}=  Generate Random Email
    Input Text      xpath=//input[@name='email']    ${random_email}
    Input Text      xpath=//input[@name='first_name']    John
    Input Text      xpath=//input[@name='last_name']    Doe

Send Registration Form
    Click Button    xpath=//button[@type='submit']

Get Registration Link from Email
    Open Connection  ${IMAP_SERVER}  ${EMAIL}  ${PASSWORD}
    Wait For New Mail  ${EMAIL_FOLDER}  subject:Activate Your Account
    ${emails}=  List Messages  ${EMAIL_FOLDER}
    ${email}=  Get Element  ${emails}  0
    ${link}=  Get Registration Link from Email Body  ${email}
    Close Connection
    RETURN  ${link}

Get Registration Link from Email Body
    [Arguments]    ${email}
    ${body}=  Get Text  ${email}
    ${link}=  Fetch From Left  ${body}  https://  ">
    RETURN  https://${link}

Open Registration Link on Website
    [Arguments]    ${link}
    Go To    ${link}

Provide Passwords
    Input Text      xpath=//input[@name='password']    ${PASSWORD}
    Input Text      xpath=//input[@name='confirm_password']    ${PASSWORD}

Send Password Form
    Click Button    xpath=//button[@type='submit']

Verify User is Logged In
    Element Should Be Visible    xpath=//a[contains(@href, 'logout')]

Generate Random Email
    ${random_number}=  Generate Random String  10
    ${random_email}=  Set Variable  testuser${random_number}@gmail.com
    RETURN  ${random_email}
