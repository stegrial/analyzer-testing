require 'spec_helper'

describe 'Preconditions' do

before (:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  # Capybara.current_session.driver.browser.manage.window.resize_to(320,568)
end

after (:all) do
  Capybara.current_session.driver.quit
  # Capybara.current_session.driver.browser.manage.window.resize_to(1024,640)
end

feature 'TrueAutomation.IO capybara example' do
  scenario 'Clicking by the Account menu items' do
    #element (Mail Options menu item) is recorded after the user authorization
    #the problem is reproduced when user tryes to click on the element second time and third time and so on!

    visit 'https://www.venus.com'

    # sleep 5
    # # find(:xpath, "(//button[@aria-label='Account'])[1]").click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button")).click
    #
    # sleep 5
    # # find(:id, 'ctl00_Body1_loginemail').set('denys.shutko@moovweb.com')
    # find(:id, ta('venus:email_field', 'ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # # find(ta("venus:email_field")).set('denys.shutko@moovweb.com')
    #
    # sleep 5
    # # find(:id, 'ctl00_Body1_loginpassword').set('asdffdsA1')
    # find(:id, ta('venus:pass_field', 'ctl00_Body1_loginpassword')).set('asdffdsA1')
    # # find(ta("venus:pass_field")).set('asdffdsA1')
    #
    # sleep 5
    # # find(:id, 'ctl00_Body1_loginbutton').click
    # find(:id, ta('venus:signin_btn', 'ctl00_Body1_loginbutton')).click
    # # find(ta("venus:signin_btn")).click
    #
    # # for i in 1..10 #to reproduce several times
    #
    # sleep 5
    # # find(:xpath, "(//button[@aria-label='Account'])[1]").click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button")).click
    #
    # sleep 5
    # # find(:xpath, "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]").click
    # find(:xpath, ta('venus:account_menu:mail_options', "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]")).click
    # # find(ta("venus:account_menu:mail_options")).click
    #
    # sleep 5
    # # find(:xpath, "(//button[@aria-label='Account'])[1]").click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button")).click
    #
    # sleep 5
    # # find(:xpath, "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]").click
    # find(:xpath, ta('venus:account_menu:mail_options', "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]")).click
    # # find(ta("venus:account_menu:mail_options")).click
    #
    # # end
    sleep 5
  end
end
end
