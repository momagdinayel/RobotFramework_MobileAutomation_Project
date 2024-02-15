*** Settings ***
Resource    ../config/base.robot
Library     AppiumLibrary

*** Keywords ***

Navigate to Voucher Section
    Wait Until Page Contains Element    ${voucher_button}       timeout=20s
    Click Element       ${voucher_button}

Enter Promo Code and Add
    [Arguments]      ${promoCode}
    Wait Until Page Contains Element    ${promo_code_field}      timeout=20s
    Input Text          ${promo_code_field}     ${promoCode}
    Click Element       ${add_promo_button}

Click profile Icon
    Wait Until Page Contains Element    ${profile_icon}    timeout=20s
    Click Element    ${profile_icon}
Verify Error Message
    Wait Until Page Contains Element    ${error_message}    timeout=20s

Click Back Button Voucher Screen
    Wait Until Page Contains Element    ${BackButtonVoucherScreen}      timeout=20s
    Click Element    ${BackButtonVoucherScreen}
Verify Navigating to Profile Screen
    Wait Until Page Contains Element    ${Personal_Information}     timeout=20s
    Wait Until Page Contains Element    ${Profile_Initial_Name}     timeout=20s
    Wait Until Page Contains Element    ${Profile_Text_Phone}     timeout=20s

*** Test Cases ***
Open Application
    Open Application    http://127.0.0.1:4723   deviceName=emulator-5562    automationName=UiAutomator2     platformName=android
    


Open Application Valid Voucher Interact
    [Documentation]    Test the Valid Voucher interactivity
    [Tags]             smoke
    Open The Application  ${remote_url}    ${DEVICE_NAME}          ${platformName}     ${app_package}      ${app_activity}
    Login to App
    Wait Until Page Contains Element    ${profile_icon}     timeout=20s
    Navigate to Voucher Section
    Enter Promo Code and Add    ${promoCode}
    Verify Error Message

Open Application Invalid Voucher Interact
    [Documentation]    Test the Invalid Voucher interactivity
    [Tags]             smoke
    Open The Application  ${remote_url}    ${DEVICE_NAME}          ${platformName}     ${app_package}      ${app_activity}
    Login to App
    Click profile Icon
    Navigate to Voucher Section
    Enter Promo Code and Add    ${promoCode}
    Verify Error Message

Verify Back Button in Voucher Screen
    [Documentation]    Test the Back Button in Voucher Screen functionality
    [Tags]             smoke
    Open The Application  ${remote_url}    ${DEVICE_NAME}          ${platformName}     ${app_package}      ${app_activity}
    Login to App
    Click profile Icon
    Navigate to Voucher Section
    Click Back Button Voucher Screen
    Verify Navigating to Profile Screen

