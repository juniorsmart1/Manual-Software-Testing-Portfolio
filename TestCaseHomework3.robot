*** Settings ***
Library             SeleniumLibrary
Resource            ${CURDIR}/VariablesLogin.robot
Resource            ${CURDIR}/KeywordsLogin.robot

Suite Setup         Set Selenium Speed                                         0.2s
Suite Teardown      Close All Browsers
Test Setup          Input data                                                 ${locator_e-mail}        user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}
Test Teardown       Close Browser


*** Test Cases ***
# TC-001 - Default Login
#     [Documentation]                                                          Default Login must be succeed
#     [Tags]                                                                   Done
#     Input data                            ${locator_e-mail}                  user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}

TC-001 - Btn_Notification_and_All_Notification
    #System can't detect Read All Notifications button
    [Documentation]                                                            Btn_Notification click must be succeed
    [Tags]                                                                     Done
    Click and Wait Btn                    ${locator_btn_Noti}                  ${locator_btn_Noti}
    Set Selenium Timeout                                                       1.5s

TC-002 - Btn_UserIcon_and_Btn_Logout
    [Documentation]                                                            Check Logout Button
    [Tags]                                                                     Done
    Click and Wait Btn                    ${locator_btn_UserIcon}          ${locator_btn_UserIcon_Logout}
    Click and Wait Btn                    ${locator_btn_UserIcon_Logout}   ${locator_e-mail}

TC-003 - Dropdown Combination 
    [Documentation]                                                            Check All Dropdown Combinations
    [Tags]                                                                     Done
    [Setup]            
    [Template]                                                                 Dropdown Combination
    #Choose Only one Dropdown
    ${locator_SelectRole}     ${locator_SelectRole_4}    0                        ${locator_Select_Plan_1}    0                          ${locator_Select_Status_1}
    0                         ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_3}    0                          ${locator_Select_Status_1}
    0                         ${locator_SelectRole_1}    0                        ${locator_Select_Plan_1}    ${locator_SelectStatus}    ${locator_Select_Status_2}
    #Choose Two Dropdown
    0                         ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_1}    ${locator_SelectStatus}    ${locator_Select_Status_1}
    ${locator_SelectRole}     ${locator_SelectRole_3}    0                        ${locator_Select_Plan_4}    ${locator_SelectStatus}    ${locator_Select_Status_2}
    ${locator_SelectRole}     ${locator_SelectRole_5}    ${locator_SelectPlan}    ${locator_Select_Plan_1}    0                          ${locator_Select_Status_3}
    
    #Choose Three Dropdown
    ${locator_SelectRole}     ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_2}    ${locator_SelectStatus}    ${locator_Select_Status_3}
    0                         ${locator_SelectRole_2}    0                        ${locator_Select_Plan_3}    0                          ${locator_Select_Status_1}
    [Teardown]        
    
TC-004 - Search - Rows per page
    [Documentation]                                                            Check Rows Per Page Response
    [Tags]                                                                     Testing
    [Setup]
    [template]    Rows Per Page 2
    1    0
    2    0
    3    0
    #Check Clear Button Response
    0    0
    [Teardown]   

TC-005 - Search - Rows per page and Back and Forth Page
    [Documentation]                                                            Check Rows Per Page and Back and Forth Page Response 
    [Tags]                                                                     Done
    [template]    Rows Per Page 2
    1    1
    2    1
    3    1

    # Click and Wait Btn                        ${locator_btn_rowsnext}          ${locator_btn_rowsback}
    # Sleep                                                                      2
    # Wait Until Page Contains                                                   26–50
    # Click Element                             ${locator_btn_rowsback}
    # Wait Until Page Contains                                                   1–25
    # Set Selenium Timeout                                                       2s

TC-006 - Check Btn_Add_User and Back                                    
    [Documentation]                                                            Check Btn_Add_User and Back response
    [Tags]                                                                     Done
    Click and Wait Btn                        ${locator_btn_addUser}           ${locator_btn_Back} 
    Click and Wait Btn                        ${locator_btn_Back}              ${locator_btn_search}
                    
TC-007 - Check User Form and Sign Up - Complete 
    [Documentation]                                                            Check Complete Sign Up response
    [Tags]                                                                     Done
    [Setup]
    [Template]    Input Data - Argument
    Kig         Suvarjanee   nuttapong.phetpradub@gmail.com     98765     0935555555    male      1    1    1    1    ${locator_SignUpButton}   0    ${EMPTY}    ${EMPTY}     
    สุรางค์       เปรมปรีย์       Surang.prempree@hotmail.com        56987413  0935566666    female    4    1    1    1    ${locator_SignUpButton}   0    ${EMPTY}    ${EMPTY}     
    [Teardown]

TC-008 - Verify Failed Case
    [Documentation]                                                            Verify failed cases
    [Tags]                                                                     Done
    [Setup]
    [Template]    Input Data - Argument
    #Invalid e-mail
    Nuttapong   Phetpradub   nuttapong.phetpradubhotmail.com     98765     0935555555    male    1    1    1    1    ${locator_SignUpButton}   1  ${Warning_EmailError}         Invalid email address     
    #Blank
    ${EMPTY}    Phetpradub   nuttapong.phetpradub@hotmail.com    98765     0935555555    male    2    1    1    1    ${locator_SignUpButton}   1  ${locator_error_firstname}    This field is required     
    Nuttapong    ${EMPTY}    nuttapong.phetpradub@hotmail.com    98765     0935555555    male    3    1    1    1    ${locator_SignUpButton}   1  ${locator_error_lastname}     This field is required 
    Nuttapong   Phetpradub   ${EMPTY}                            98765     0935555555    male    4    1    1    1    ${locator_SignUpButton}   1  ${locator_error_email}        This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    ${EMPTY}  0935555555    male    1    1    1    1    ${locator_SignUpButton}   1  ${locator_error_password}     This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    98765     ${EMPTY}      male    2    1    1    1    ${locator_SignUpButton}   1  ${locator_error_mobile}       This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    98765     0935555555    empty   3    1    1    1    ${locator_SignUpButton}   1  ${locator_error_gender}       This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    98765     0935555555    male    0    1    1    1    ${locator_SignUpButton}   1  ${locator_error_course}       This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    98765     0935555555    male    1    0    1    1    ${locator_SignUpButton}   1  ${locator_error_nationality}  This field is required 
    Nuttapong   Phetpradub   nuttapong.phetpradub@hotmail.com    98765     0935555555    male    2    1    0    1    ${locator_SignUpButton}   1  ${locator_error_role}         This field is required 
    [Teardown]

TC-009 - Check Kru P'Beam Hyperlink
    #ลิงค์ปลายทางเหมือนจะเช็คไม่ได้ 
    [Documentation]                                                            Btn_UserIcon click must be succeed
    [Tags]                                                                     Done
    Wait Until Element Is Visible             ${locator_btn_KruPBeam} 
    Click Element                             ${locator_btn_KruPBeam}                  
    Set Selenium Timeout                                                       2s


    










#Legacy
# TC004 - Check Dropdown Separately
#     [Documentation]                                                            Dropdown must show List
#     [Tags]                                                                     Testing
#     Wait Until Element Is Visible         ${locator_SelectRole}
#     @{list1}    Create List               ${locator_SelectRole}                ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_1}    ${locator_SelectStatus}    ${locator_Select_Status_1}
#     FOR                                   ${locator_Select}                    ${locator_Select_List}  IN    @{list1}
#         Dropdown One by One               ${locator_Select}                    ${locator_Select_List}         
#     END
    
# TC005 - Check Dropdowns - Two Combinations
#     #ต้องเพิ่มในส่วนของ Element Visible หลังการกดปุ่ม Search หรือไม่?
#     [Documentation]                                                            Dropdown must show List
#     [Tags]                                                                     Testing
#     [Template]                                                                 Dropdown Combination - Two Combo
#     #Dropdown 1: Select Role and 2: Select Plan
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_1}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_2}    ${locator_SelectPlan}    ${locator_Select_Plan_2}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_3}    ${locator_SelectPlan}    ${locator_Select_Plan_3}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_4}    ${locator_SelectPlan}    ${locator_Select_Plan_4}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_5}    ${locator_SelectPlan}    ${locator_Select_Plan_2}

#     #Dropdown 1: Select Role and 3: Select Status
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_1}    ${locator_SelectStatus}    ${locator_Select_Status_1}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_2}    ${locator_SelectStatus}    ${locator_Select_Status_2} 
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_3}    ${locator_SelectStatus}    ${locator_Select_Status_3} 
    
#     #Dropdown 2: Select Plan and 3: Select Status
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectPlan}    ${locator_Select_Plan_1}    ${locator_SelectStatus}    ${locator_Select_Status_1}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectPlan}    ${locator_Select_Plan_2}    ${locator_SelectStatus}    ${locator_Select_Status_2} 
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectPlan}    ${locator_Select_Plan_3}    ${locator_SelectStatus}    ${locator_Select_Status_3} 

    

# TC006 - Check Dropdown Combination - Three Combo
#     [Documentation]                                                            Dropdown must show List
#     [Tags]                                                                     Testing
#     [Template]                                                                 Dropdown Combination - Three Combo
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_1}    ${locator_SelectPlan}    ${locator_Select_Plan_1}    ${locator_SelectStatus}    ${locator_Select_Status_1}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_2}    ${locator_SelectPlan}    ${locator_Select_Plan_2}    ${locator_SelectStatus}    ${locator_Select_Status_2}
#         ${URL}    ${browser}    ${locator_e-mail}    user.test@krupbeam.com    ${locator_password}    123456789    ${locator_Loginbtn}    ${locator_SelectRole}    ${locator_SelectRole_3}    ${locator_SelectPlan}    ${locator_Select_Plan_3}    ${locator_SelectStatus}    ${locator_Select_Status_3}
