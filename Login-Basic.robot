*** Settings ***
Library                                     SeleniumLibrary


*** Variables ***
${url}                                      https://automate-test.stpb-digital.com/login/ 
${browser}                                  chrome
${locator_email}                            id=email
${locator_password}                         name=password
${locator_btnlogin}                         id=btn-login
${locator_warnmsg_email}                    xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p    
${locator_passmsg_email}                    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_e-mail_invalid}                   xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p   
${locator_Hyperlink_Create_acc}             css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a
${body}                                     css=body


*** Keywords ***
Open Web browser      
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input successful e-mail for Login Page
    Input Text    ${locator_email}          Beam1234@gmail.com 

Input data for Login Page
    Input Text    ${locator_email}          Beam1234@gmail.com 
    Input Password    ${locator_password}   1234567890 
    Click Element    ${locator_btnlogin}

Input data for Login Page E-mail Failed
    Input Text    ${locator_email}          09912345678
    Click Element    ${body}

Input data for Login Page Password Success
    Input Password    ${locator_password}   1234567890

Input data for Login Page Password Failed
    Input Text    ${locator_email}          ไทย
    Input Password    ${locator_password}   12
    Click Element    ${locator_btnlogin}

Input data for Login Invalid
    Input Text    ${locator_email}          Beam12345678@gmail.com
    Input Password    ${locator_password}   12345678900
    Click Element    ${locator_btnlogin}

Input data for Omitting Unrequired Field
    Input Text    ${locator_email}    ${empty}
    Input Password    ${locator_password}    ${empty}
    Click Element    ${locator_btnlogin}

Input data for Create An Account Hyperlink
    Click Element    ${locator_Hyperlink_Create_acc}


*** Test Cases ***
TC002 - Loading Testing
    Open Web browser
    Wait Until Page Contains                Kru P' Beam
    Close Browser

TC003 - login pass
    Open Web browser
    Input successful e-mail for Login Page
    Close Browser

TC004 - login E-mail failed
    Open Web browser
    Input data for Login Page E-mail Failed
    ${txt}=    Get Text    ${locator_warnmsg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email
    Close Browser

TC005 - login password Success
    Open Web browser
    Input data for Login Page Password Success
    Close Browser

TC006 - login Password failed
    Open Web browser
    Input data for Login Page Password Failed
    ${txt}=    Get Text    ${locator_passmsg_email}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters
    Close Browser

TC007 - login Success
    Open Web browser
    Input data for Login Page
    Close Browser

TC008 - login with invalid e-mail
    Open Web browser
    Input data for Login Invalid
    ${txt}=    Get Text    ${locator_e-mail_invalid}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid                                           
    Close Browser

TC009 - login without required field filling
    Open Web browser
    Set Selenium Speed    2
    Input data for Omitting Unrequired Field
    ${txt}=    Get Text    ${locator_e-mail_invalid}
    Should Be Equal As Strings    ${txt}    email is a required field
    ${txt}=    Get Text    ${locator_passmsg_email}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters
    Close Browser

TC010 - Create an account Hyperlink
    Open Web browser
    Input data for Create An Account Hyperlink
    Wait Until Page Contains                Kru P' Beam
    Close Browser

    


