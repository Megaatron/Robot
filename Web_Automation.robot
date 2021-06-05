*** Settings ***

Library  SeleniumLibrary
Library    ../Resources/UserDefinedkeywords.py


*** Variables ***

${URL}  https://testcompany-a0.my.salesforce.com/
${Username}    nivatha93-shpf@force.com
${Password}    Test@123

*** Test Cases ***

Verify the functionality of login

  [Teardown]    run keyword if test passed    close browser

   Login_Nonheadless    ${URL}
   wait until element is enabled    //input[@id = 'username'] 10s
   input text    //input[@id = 'username']    ${Username}
   input text     //input[@id = 'password']    ${Password}
   click element  //input[@id = 'Login']
   #wait until element is enabled    //span[text() = 'Accounts']
   capture page screenshot    Login_Successfull.png
   Create Account



*** Keywords ***

Login_headless_Chrome    [Arguments]    ${URL}

    open browser    ${URL}    headlesschrome
    maximize browser window

Login_headless_Chrome    [Arguments]    ${URL}

    open browser    ${URL}    headlesschrome
    maximize browser window


Login_Nonheadless    [Arguments]    ${URL}

    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To     ${URL}
    maximize browser window

Create Account

    #click element   //one-app-nav-bar-item-root[@class="navItem slds-context-bar__item slds-shrink-none"][a[span[text()='Accounts']]]
    wait until element is enabled    //span[text()='Accounts']//parent::a//parent::one-app-nav-bar-item-root
    click element    //span[text()='Accounts']//parent::a//parent::one-app-nav-bar-item-root
    wait until element is enabled    //div[text() = "New"]//parent::a//parent::li
    click element    //div[text() = "New"]//parent::a//parent::li
    wait until element is enabled    //button[@title = 'Save']
    wait until element is visible  (//input[@role = 'combobox'])[3]
    ${AccountName}    get_random_string  10
    input text    (//input[@role = 'combobox'])[3]     ${AccountName}
    click element     //button[@title = 'Save']
    wait until element is visible  (//span[text() = '${AccountName}'])[2]
    element should be visible    (//span[text() = '${AccountName}'])[2]

Modify Account

    wait until element is enabled    //span[text()='Accounts']//parent::a//parent::one-app-nav-bar-item-root
    click element    //span[text()='Accounts']//parent::a//parent::one-app-nav-bar-item-root
