*** Settings ***
Library           AppiumLibrary



*** Keywords ***

Open The Application
    [Arguments]    ${remote_url}    ${DEVICE_NAME}          ${platformName}     ${app_package}      ${app_activity}
    Open Application    ${remote_url}      deviceName=${DEVICE_NAME}    automationName=UiAutomator2     platformName=${platformName}    appPackage=${app_package}     appActivity=${app_activity}

Login to App
    Wait Until Page Contains Element    ${country_Icon}     timeout=20s
    Click Element    ${country_Icon}
    Wait Until Page Contains Element    ${country_choose}     timeout=20s
    Click Element    ${country_choose}
    Wait Until Page Contains Element    ${Algeria}     timeout=20s
    Click Element    ${Algeria}
    Wait Until Page Contains Element    ${phoneNumber}     timeout=20s
    Input Text    ${phoneNumber}    555000555
    Click Element    ${sendButton}
    Wait Until Page Contains Element    ${locationButtonEnable}     timeout=20s
    Click Element    ${locationButtonEnable}


*** Variables ***
${country_Icon}               com.yatechnologies.yassir_rider.preprod:id/iv_flagIcon
${country_choose}             com.yatechnologies.yassir_rider.preprod:id/image_country_flag
${Algeria}                    //android.widget.TextView[@resource-id="com.yatechnologies.yassir_rider.preprod:id/text_country_name" and @text="Algeria"]
${phoneNumber}                com.yatechnologies.yassir_rider.preprod:id/edit_text_phone_number
${sendButton}                 com.yatechnologies.yassir_rider.preprod:id/button_send
${skipButton}                 com.yatechnologies.yassir_rider.preprod:id/tvSkip
${locationButtonEnable}       //android.widget.TextView[@resource-id="com.yatechnologies.yassir_rider.preprod:id/tvSkip"]
${BackButtonVoucherScreen}    id=${app_package}:id/toolbar_left_button_icn
${promoCode}                  45454545
${remote_url}                 http://127.0.0.1:4723
${platformName}               Android
${android_platform_version}   12
${device_name}                emulator-5562
${app_path}                   C:/Users/mohamed.ali/Desktop/Backlog/app-preproduction-google-debug.apk
${app_package}                com.yatechnologies.yassir_rider.preprod
${app_activity}               com.yassir.dashboard.presentation.dashboard.DashboardActivity
${profile_icon}               com.yatechnologies.yassir_rider.preprod:id/text_user_name_initial
${auto_grant_permissions}     true
${no_reset}                   true
${voucher_button}             xpath=(//*[@resource-id="com.yatechnologies.yassir_rider.preprod:id/menu_item_row"])[7]
${promo_code_field}           id=${app_package}:id/edit_discount
${add_promo_button}           id=${app_package}:id/button
${error_message}              id=${app_package}:id/text_message
${offer_button}               xpath=//android.widget.TextView[@resource-id="id:${app_package}:id/label" and @text="Offers"]
${offer_screen_title}         xpath=//android.widget.TextView[@text="Offers and promotions"]
${Personal_Information}       xpath=//android.widget.TextView[@resource-id="com.yatechnologies.yassir_rider.preprod:id/label" and @text="Personal information"]
${Profile_Initial_Name}       id=${app_package}:id/text_name_initial
${Profile_Text_Phone}         id=${app_package}:id/text_phone



${desired_capabilities}=    Create Dictionary
...                         platformName=android
...                         platformVersion=${android_platform_version}
...                         deviceName=${device_name}
...                         app=${app_path}
...                         autoGrantPermissions=${auto_grant_permissions}
...                         noReset=${no_reset}
