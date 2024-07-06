*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

*** Variables ***
${ENVIRONMENT}    ${ENV}

*** Test Cases ***
Register User on Tagesspiegel
    Open Tagesspiegel Website    ${ENVIRONMENT}
    Click Anmelden Link
    Choose Registrieren Tab
    Fill Registration Form
    Send Registration Form
    ${registration_link}=    Get Registration Link from Email
    Open Registration Link on Website    ${registration_link}
    Provide Passwords
    Send Password Form
    Verify User is Logged In
