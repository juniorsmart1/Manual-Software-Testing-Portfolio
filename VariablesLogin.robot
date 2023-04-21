**** Variables ****
#Login Page
${URL}                                     https://automate-test.stpb-digital.com/login/
${browser}                                 chrome
${locator_e-mail}                          id=email
${locator_password}                        name=password
${locator_Loginbtn}                        id=btn-login 
${locator_btn_Back}                        css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(1) > button

#Search Filters Page
${locator_btn_Noti}                        xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_btn_AllNoti}                     css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button
${locator_btn_UserIcon}                    css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > header > div > div > div.actions-right.MuiBox-root.css-70qvj9 > span
${locator_btn_UserIcon_Logout}             css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li
${locator_SelectRole}                      id=select-role
${locator_SelectPlan}                      id=select-plan
${locator_SelectStatus}                    id=select-status
${locator_btn_clear}                       id=btn-clear
${locator_btn_search}                      id=btn-search
${locator_btn_addUser}                     css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiBox-root.css-qeuhnc > div > a
${locator_btn_KruPBeam}                    xpath=//*[@id="__next"]/div[1]/div[2]/footer/div/div/p/a



#Search Filter Option Elements
#Select Role
${locator_SelectRole_1}                    id=option-select-role-1
${locator_SelectRole_2}                    id=option-select-role-2
${locator_SelectRole_3}                    id=option-select-role-3
${locator_SelectRole_4}                    id=option-select-role-4
${locator_SelectRole_5}                    id=option-select-role-5

#Select Plan
${locator_Select_Plan_1}                   id=option-select-plan-1
${locator_Select_Plan_2}                   id=option-select-plan-2 
${locator_Select_Plan_3}                   id=option-select-plan-3
${locator_Select_Plan_4}                   id=option-select-plan-4

#Select Status
${locator_Select_Status_1}                 id=option-select-status-1
${locator_Select_Status_2}                 id=option-select-status-2 
${locator_Select_Status_3}                 id=option-select-status-3

${Locator_Hostinger}                       xpath=/html/body/div/div/a[2]


${locator_result_Number}                   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]


${locator_btn_rowsperpage}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${locator_btn_rowsTen}                     xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_btn_rowsTwentyFive}              xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_btn_rowsFifty}                   xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_btn_rowsnext}                    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]
${locator_btn_rowsback}                    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]



#KruP'Beam User Form                       https://automate-test.stpb-digital.com/user/form/
${locator_Firstname}                                id=firstname
${locator_Lastname}                                 id=lastname
${locator_E-mail}                                   id=email                                
${locator_UserForm_Password}                        id=password                                            
${locator_mobile-phone}                             id=mobile-phone 

#Interactive Buttons
${locator_PasswordButton}                           id=icon-toggle-show-password
${locator_Gender}                                   validation-basic-radio
${locator_SQLCheckbox}                              name=courses.SQL
${locator_TestManualCheckbox}                       name=courses.Test Manual
${locator_AutomateCheckbox}                         name=courses.Automate Test
${locator_Automate2Checkbox}                        name=courses.Automate Test2
${locator_NationalityListbox}                       id=nationality                           
${locator_SelectRoleListbox}                        id=select-role                           
${locator_SelectPlanListbox}                        id=select-plan                           
${locator_ResetButton}                              css=#reset
${locator_SignUpButton}                             css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(3) > div > div > div > form > button
${locator_SigninInsteadButton}                      xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a
${locator_OKButton}                                 id=btn-ok
${Warning_EmailError}                               id=error-email

#errormsg
${locator_error_firstname}                          id=error-firstname
${locator_error_lastname}                           id=error-lastname
${locator_error_email}                              id=error-email
${locator_error_password}                           id=error-password
${locator_error_mobile}                             id=error-mobile-phone
${locator_error_gender}                             id=validation-basic-gender
${locator_error_course}                             id=validation-basic-courses
${locator_error_nationality}                        id=validation-basic-nationality
${locator_error_role}                               id=validation-role
${locator_error_plan}                               id=validation-plan
