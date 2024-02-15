*** Settings ***
Resource    ../config/base.robot
Resource    voucher.robot
Library     AppiumLibrary

*** Keywords ***
Click Offer Button
    Wait Until Page Contains Element    ${offer_button}
    Click Element       ${offerButton}
    
Verify Screen title
    Wait Until Page Contains Element    ${offerScreenTitle}     timeout=20s

*** Test Cases ***
Open Application offer Interact
    [Documentation]    Test the offer functionality
    [Tags]             smoke
    Open The Application  ${remote_url}    ${DEVICE_NAME}          ${platformName}     ${app_package}      ${app_activity}
    Login to App
    Wait Until Page Contains Element    ${profileIcon}     timeout=15s
    Click profile Icon
    Click Offer Button
    Verify Screen title
    Wait Until Page Contains Element    ////android.widget.TextView[@text="offer"]



