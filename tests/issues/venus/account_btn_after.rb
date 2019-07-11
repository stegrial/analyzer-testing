require 'spec_helper'
require_relative '../../step_definitions/venus.rb'

describe 'Preconditions' do

before(:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  # Capybara.current_session.driver.browser.manage.window.resize_to(320,568)
end

after(:all) do
  Capybara.current_session.driver.quit
  # Capybara.current_session.driver.browser.manage.window.resize_to(1024,640)
end

context 'Clicking by Account button when user is logged' do
  it 'User goes to the page' do
    # open_page('venus')['home_page']
    open_page "https://venus.com"
  end

  it 'User clicks on the Account button' do |arg|
    click_element("venus:account_button:#{arg}", "(//button[@aria-label='Account'])[1]")
  end

  it 'User fills the Email field' do
    value = 'denys.shutko@moovweb.com'
    fill_the_field('venus:email_field', 'ctl00_Body1_loginemail', value)
  end

    #element (account button) is recorded AFTER user is logged in
    #but the problem is reproduced BEFORE user authorization!

    # user_goes_to_page settings('venus')['home_page']
    # user_clicks_account_btn 'before_authorization'
    # user_fills_email_field 'denys.shutko@moovweb.com'
    # user_fills_password_field 'asdffdsA1'
    # user_clicks_signin_btn
    # user_clicks_account_btn 'after_authorization'
    # user_clicks_account_btn 'after_authorization'
    # sleep 2
    #
    # user_clicks_logout_btn
    # user_clicks_account_btn 'after_authorization'

    sleep 5



    # visit 'https://venus.com'
    #
    # #sleep 10
    # # find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button_after', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button")).click
    #
    # #sleep 10
    # # find(:id, ('ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # find(:id, ta('venus:email_field', 'ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # # find(ta("venus:email_field")).set('denys.shutko@moovweb.com')
    #
    # #sleep 10
    # # find(:id, ('ctl00_Body1_loginpassword')).set('asdffdsA1')
    # find(:id, ta('venus:pass_field', 'ctl00_Body1_loginpassword')).set('asdffdsA1')
    # # find(ta("venus:pass_field")).set('asdffdsA1')
    #
    # #sleep 10
    # # find(:id, ('ctl00_Body1_loginbutton')).click
    # find(:id, ta('venus:signin_btn', 'ctl00_Body1_loginbutton')).click
    # # find(ta("venus:signin_btn")).click
    #
    # # for i in 1..10
    #
    # #sleep 10
    # # find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button_after', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button_after")).click
    #
    # #sleep 10
    # # find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button_after', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button_after")).click
    #
    # sleep 2
    # # find(:id, 'ctl00_hl_logout').click
    # find(:id, ta('venus:account:logout_btn', 'ctl00_hl_logout')).click
    # # find(ta('venus:account:logout_btn')).click
    #
    # #sleep 10
    # # find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button_after', "(//button[@aria-label='Account'])[1]")).click
    # # find(ta("venus:account_button")).click
    #
    # # end
    # sleep 5
end
end
