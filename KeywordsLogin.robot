*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/VariablesLogin.robot


*** Keywords ***
 Open Web Browser
    [Arguments]                                ${link}           ${browser}
    Open Browser                               ${link}           ${browser}
    Maximize Browser Window 

Input data
    Open Web Browser                           ${URL}            ${browser}
    #For Login Page
    [Arguments]                                ${e-mail_or_ID}         ${txt1}        ${pass}        ${txt2}        ${locator_LoginBtn}  
    Wait Until Element Is Visible              ${e-mail_or_ID}         
    Input Text                                 ${e-mail_or_ID}         ${txt1}        
    Input Password                             ${pass}                 ${txt2}               
    Click Element                              ${locator_LoginBtn}

Click and Wait Btn
    [Arguments]                                ${btn_locator1}        ${btn_locator2}
    Wait Until Element Is Visible              ${btn_locator1}
    Click Element                              ${btn_locator1}
    Wait Until Element Is Visible              ${btn_locator2}

Click and Wait Keyword
    [Arguments]                                ${btn_locator1}        ${text}
    Wait Until Element Is Visible              ${btn_locator1}
    Click Element                              ${btn_locator1}
    Wait Until Page Contains                   ${text}

Dropdown Combination 
    [Arguments]                                ${dropdown_element1}    ${List_element1}    ${dropdown_element2}    ${List_element2}    ${dropdown_element3}    ${List_element3}    
    Input data                                 ${locator_e-mail}       user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}                                        
    Wait Until Element Is Visible              ${locator_SelectRole}
   IF  "${dropdown_element1}" != "0"
    Click Element                              ${dropdown_element1}
    Click Element                              ${List_element1}   
   END
   IF  "${dropdown_element2}" != "0"
    Click Element                              ${dropdown_element2}
    Click Element                              ${List_element2}
   END 
    IF  "${dropdown_element3}" != "0"
    Click Element                              ${dropdown_element3}
    Click Element                              ${List_element3}
   END  
    Wait Until Element Is Visible              ${locator_btn_search}
    Click Element                              ${locator_btn_search}
    Wait Until Element Is Visible              ${locator_btn_clear}
    Click Element                              ${locator_btn_clear}   
    Close Browser

Rows Per Page 2
    [arguments]                                ${locator_rows_check}    ${locator_backandforth_check}
    Input data       ${locator_e-mail}         user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}
    Click and Wait Btn                         ${locator_btn_search}    ${locator_btn_rowsperpage}
    Click Element                              ${locator_btn_rowsperpage}
    IF  ${locator_rows_check} == 1
        Wait Until Element Is Visible          ${locator_btn_rowsTen}
        Sleep                                  1.5
        Click Element                          ${locator_btn_rowsTen}
        Execute JavaScript                     window.scrollTo(0, document.body.scrollHeight)
        Sleep                                  2
        Wait Until Page Contains               1–10
        IF  ${locator_backandforth_check} == 1
        Click and Wait Btn                     ${locator_btn_rowsnext}          ${locator_btn_rowsback}
        Sleep                                                                      2
        Wait Until Page Contains                                                   11–20
        Click Element                          ${locator_btn_rowsback}
        Wait Until Page Contains                                                   1–10
        Set Selenium Timeout                                                       2s      
        END
        
    ELSE IF  ${locator_rows_check} == 2
        Wait Until Element Is Visible          ${locator_btn_rowstwentyfive}
        Sleep                                  1.5
        Click Element                          ${locator_btn_rowstwentyfive}
        Sleep                                  1.5
        Execute JavaScript                     window.scrollTo(0, document.body.scrollHeight)
        Sleep                                  2
        Wait Until Page Contains               1–25
        IF  ${locator_backandforth_check} == 1
        Click and Wait Btn                        ${locator_btn_rowsnext}          ${locator_btn_rowsback}
        Sleep                                                                      2
        Wait Until Page Contains                                                   26–50
        Click Element                             ${locator_btn_rowsback}
        Wait Until Page Contains                                                   1–25
        Set Selenium Timeout                                                       2s      
        END

    ELSE IF  ${locator_rows_check} == 3
        Wait Until Element Is Visible          ${locator_btn_rowsFifty}
        Sleep                                  1.5
        Click Element                          ${locator_btn_rowsFifty}
        Sleep                                  1.5    
        Execute JavaScript                     window.scrollTo(0, document.body.scrollHeight)
        Sleep                                  2
        Wait Until Page Contains               1–50
        IF  ${locator_backandforth_check} == 1
        Click and Wait Btn                     ${locator_btn_rowsnext}          ${locator_btn_rowsback}
        Sleep                                                                      2
        Wait Until Page Contains                                                   51–53
        Click Element                          ${locator_btn_rowsback}
        Wait Until Page Contains                                                   1–50
        Set Selenium Timeout                                                       2s      
        END
        
    ELSE IF  ${locator_rows_check} == 0 
        Click Element                          ${locator_btn_rowsTen}     
        IF  ${locator_backandforth_check} == 0
        
        Click Element                          ${locator_btn_clear} 
        Wait Until Page Contains                                                   0-0 
        END
        Set Selenium Timeout                                                       2s                                     
    END
    Close Browser


#Kru P'Beam Input Fields
Verify Error Msg
    [arguments]                             ${locator}    ${error_msg}
    Wait Until Element Is Visible           ${locator}
    ${E-txt}=    Get Text                   ${locator}
    Should Be Equal As Strings  ${E-txt}    ${error_msg}    

Input Data - Argument
    [Arguments]                             ${Firstname}    ${Lastname}    ${E-mail}    ${UserForm_Password}    ${mobile-phone}   ${gender_ch}   ${chkbox}  ${national}  ${role}  ${plan}  ${SignUpButton}  ${locator_check}   ${locator_error}  ${error_msg}                  
    Input data                              ${locator_e-mail}     user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}                                        
    Wait Until Element Is Visible           ${locator_btn_addUser}    1s
    Click Element                           ${locator_btn_addUser}
    Input Text                              ${locator_Firstname}           ${Firstname}
    Input Text                              ${locator_Lastname}            ${Lastname}
    Input Text                              ${locator_E-mail}              ${E-mail}
    Input Password                          ${locator_UserForm_Password}   ${UserForm_Password}
    Input Text                              ${locator_mobile-phone}        ${mobile-phone}
    IF                                      "${gender_ch}" !="empty"
        Select Radio Button                 ${locator_Gender}   ${gender_ch}
    END
    
    IF                                      ${chkbox} == 1
        Select Checkbox                     ${locator_SQLCheckbox}  
    ELSE IF                                 ${chkbox} == 2              
        Select Checkbox                     ${locator_SQLCheckbox}
        Select Checkbox                     ${locator_TestManualCheckbox}  
    ELSE IF                                 ${chkbox} == 3
        Select Checkbox                     ${locator_SQLCheckbox}
        Select Checkbox                     ${locator_AutomateCheckbox}   
    ELSE IF                                 ${chkbox} == 4
        Select Checkbox                     ${locator_SQLCheckbox}
        Select Checkbox                     ${locator_TestManualCheckbox}
        Select Checkbox                     ${locator_AutomateCheckbox} 
        Select Checkbox                     ${locator_Automate2Checkbox} 
    END
    
    IF                                      ${national} == 1
        Click Element                       ${locator_NationalityListbox}
        Wait Until Element Is Visible                                         xpath=//*[@id="menu-"]/div[3]/ul/li[221]
        Click Element                                                         xpath=//*[@id="menu-"]/div[3]/ul/li[221] 
    END

    IF                                      ${role} == 1
        Click Element                       ${locator_SelectRoleListbox}
        Wait Until Element Is Visible                                         xpath=//*[@id="menu-"]/div[3]/ul/li[1]
        Click Element                                                         xpath=//*[@id="menu-"]/div[3]/ul/li[1] 
    END

    IF                                      ${plan} == 1
        Click Element                       ${locator_SelectPlanListbox}
        Wait Until Element Is Visible                                         xpath=//*[@id="menu-"]/div[3]/ul/li[1]
        Click Element                                                         xpath=//*[@id="menu-"]/div[3]/ul/li[1] 
    END
    Click Element                           ${SignUpButton}

    IF                                      ${locator_check} ==0
        Wait Until Page Contains            Register Success
        Wait Until Element Is Visible       ${locator_OKButton}
        Click Element                       ${locator_OKButton}                    
    ELSE IF                                 ${locator_check} == 1
        Wait Until Element Is Visible       ${locator_error}    
        Verify Error Msg                    ${locator_error}    ${error_msg}
    END
    Close Browser  





