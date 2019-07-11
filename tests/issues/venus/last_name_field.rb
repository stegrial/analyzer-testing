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
  scenario 'Filling the Last name field' do
    #element (Last name field) is recorded after going by the strait link to the page
    #reproducing: step by step (the problem is not reproduced)

    visit 'https://www.venus.com'
    # visit 'https://www.venus.com/secure/newaccount.aspx'

    # for i in 1..5 #to reproduce several times

    # sleep 5
    # find(:xpath, "(//button[@aria-label='Account'])[1]").click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    find(ta("venus:account_button")).click

    # sleep 5
    # find(:xpath, "//a[text()='Create Account']").click
    # find(:xpath, ta('venus:create_account_button', "//a[text()='Create Account']")).click
    find(ta("venus:create_account_button")).click

    # sleep 5
    # find(:id, 'ctl00_Body1_firstname').set('Jane')
    # find(:id, ta('venus:create_account:first_name', 'ctl00_Body1_firstname')).set('Jane')
    find(ta("venus:create_account:first_name")).set('Jane')

    # sleep 5
    # find(:id, 'ctl00_Body1_lastname').set('Air')
    # find(:id, ta('venus:account_info:last_name', 'ctl00_Body1_lastname')).set('Air') #element is recorded on the account info page - problem is reproduced
    # find(:id, ta('venus:create_account:last_name', 'ctl00_Body1_lastname')).set('Air')
    find(ta("venus:create_account:last_name")).set('Air')

    # end
    sleep 5
  end
end
end
