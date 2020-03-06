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
  scenario 'Clicking by Hamburger menu items' do
    #element is recorded on the login page after the first step
    #but the problem is reproduced when user is logged in!

    visit 'https://www.venus.com'

    # sleep 20
    # find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    find(ta("venus:account_button")).click

    # sleep 10
    # find(:id, ('ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # find(:id, ta('venus:email_field', 'ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    find(ta("venus:email_field")).set('denys.shutko@moovweb.com')

    # sleep 10
    # find(:id, ('ctl00_Body1_loginpassword')).set('asdffdsA1')
    # find(:id, ta('venus:pass_field', 'ctl00_Body1_loginpassword')).set('asdffdsA1')
    find(ta("venus:pass_field")).set('asdffdsA1')

    # sleep 10
    # find(:id, ('ctl00_Body1_loginbutton')).click
    # find(:id, ta('venus:signin_btn', 'ctl00_Body1_loginbutton')).click
    find(ta("venus:signin_btn")).click

    # sleep 10
    # find(:xpath, ("//button[@aria-label='Menu']")).click
    # find(:xpath, ta('venus:ham_menu_btn', "//button[@aria-label='Menu']")).click
    find(ta("venus:ham_menu_btn")).click

    # sleep 10
    # find(:xpath, "(//li[./div[text()='About Us']])[2]").click
    # find(:xpath, ta('venus:ham_menu:about_us', "(//li[./div[text()='About Us']])[2]")).click
    find(ta("venus:ham_menu:about_us")).click

    sleep 5
  end
end
end
