*** Settings ***
Library     Selenium2Library


*** Variables ***
${browser}  chrome
${url}  https://api.staging.foodorderingsystem.halcyondigitalhost.com/login
${email}    qa@applicant.com
${password}     D4Q8ayaKHmKqDF%X

*** Test Cases ***
Login Test
    open browser        ${url}      ${browser}
    maximize browser window
    location should be     ${url}
    input text      id:email        ${email}
    input text      id:password     ${password}
    click element       xpath:/html/body/div/main/form/div[4]/button
    location should be      https://api.staging.foodorderingsystem.halcyondigitalhost.com/dashboard
    page should contain     Daily Sales
    page should contain     Weekly Sales
    page should contain     Monthly Sales
    page should contain     Registered Users
    page should contain     Pending Orders
    wait until page contains    Variants
    click link      Variants
    wait until page contains    Variant List
    click link    xpath://*[@id="app"]/main/div/div/div/div[1]/div[2]/div/a
    wait until page contains    Create Variant
    input text      id:title        Test Variants_01
    select from list by label       variant_type_id     Flavor
    input text      id:description      Automated Applicant Test
    select from list by label       status      Enabled
    click button        xpath://*[@id="save_and_continue"]
    wait until page contains    Variant successfully created!    10s
    Sleep       3s
    Close browser

*** Keywords ***
