*** Settings ***
Library                          SeleniumLibrary


*** Variables ***
${url}                           https://www.ebay.com/    
${browser}                       gc
${locator_search}                id=gh-ac
${locator_btn_search}            id=gh-btn
${locator_select_Cat}            id=gh-cat
${locator_result_Number}         xpath=//*[@id="mainContent"]/div[1]/div/div[2]/div[1]/div[1]/h1/span[1]
${locator_product_name}          xpath=//*[@id="srp-river-results"]/ul/li[1]/div/div[2]/a/div/span
${locator_checkbox_Brand}        xpath=//*[@id="x-refine__group_1__0"]/ul/li[2]/div/a/div/span/input                      
${locator_result_product}        xpath=//*[@id="srp-river-results"]/ul/li[2]/div/div[2]/a/div/span


*** Keywords ***
Key01 - Open Ebay Browser
    Open Browser                      ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible     ${locator_search}     

Key02 - Verify Input - Search Data - press key
    Wait Until Element Is Visible     ${locator_search} 
    Input Text                        ${locator_search}             Iphone
    Key04 - Select Category
    Press Keys                        ${locator_search}             ENTER

Key03 - Verify Input - Search Data - Click btn
    Wait Until Element Is Visible     ${locator_search} 
    Input Text                        ${locator_search}             Iphone
    Key04 - Select Category
    Click Element                     ${locator_btn_search}

Key04 - Select Category
    Wait Until Element Is Visible     ${locator_select_Cat} 
    Click Element                     ${locator_select_Cat} 
    Select From List By Value         ${locator_select_Cat}         58058

Key05 - Select Product Result
    Wait Until Element Is Visible     ${locator_product_name}
    Click Element                     ${locator_product_name}
    Wait Until Page Contains          2in1 STYLUS TOUCH & RESISTANCE SCREEN PEN FOR IPHONE IPAD SAMSUNG TABLET DOC SIG
    Close Browser

Key06 - Select Product Result2 - Checkbox
    Wait Until Element Is Visible     ${locator_product_name}
    Click Element                     ${locator_product_name}
    Wait Until Element Is Visible     ${locator_result_product}
    Close Browser

*** Test Cases ***
TC001- Verify Input Text - Key
    Key01 - Open Ebay Browser
    Key02 - Verify Input - Search Data - press key
    Close Browser

TC002- Verify Input Text - Click Btn
    Key01 - Open Ebay Browser
    Key03 - Verify Input - Search Data - Click btn
    Close Browser

TC003- Verify Result Data
    Key01 - Open Ebay Browser
    Key02 - Verify Input - Search Data - press key
    Wait Until Element Is Visible     ${locator_result_Number}
    ${Res_Num}    Get Text            ${locator_result_Number}
    IF  ${Res_Num} > 0
        Key05 - Select Product Result   
    ELSE
        Close Browser    
    END
    Close Browser   

TC004- Verify Result - Checkbox
    Key01 - Open Ebay Browser
    Key03 - Verify Input - Search Data - Click btn
    Wait Until Element Is Visible     ${locator_result_Number}
    Checkbox Should Be Selected       ${locator_checkbox_Brand}
    Wait Until Element Is Visible     ${locator_result_Number}
    ${Res_Num}    Get Text            ${locator_result_Number}
    Log To Console    ${Res_Num}
    IF  ${Res_Num} > 0
        Key06 - Select Product Result2 - Checkbox    
    END
    Close Browser   