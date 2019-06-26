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
  scenario 'Clicking on the filter after the search' do
    #element (filter) is recorded before user is logged
    #the problem is reproduced after user autorization!
    #and the problem is reproduced before user autorization!

    visit 'https://www.venus.com'

    # sleep 10
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
    # find(:xpath, "//button[@aria-label='Search']").click
    # find(:xpath, ta('venus:main:search_button', "//button[@aria-label='Search']")).click
    find(ta("venus:main:search_button")).click

    # sleep 10
    # find(:xpath, "//input[contains (@placeholder, 'Search')]").set('white')
    # find(:xpath, ta('venus:search_page:search_field', "//input[contains (@placeholder, 'Search')]")).set('white')
    find(ta("venus:search_page:search_field")).set('white')

    # sleep 10
    # find(:xpath, "//button[@variant='raised']").click
    # find(:xpath, ta('venus:search_page:search_button', "//button[@variant='raised']")).click
    find(ta("venus:search_page:search_button")).click

    # sleep 10
    # find(:xpath, "//div[@role='button']").click
    # find(:xpath, ta('venus:search_results:filter_button', "//div[@role='button']")).click
    find(ta("venus:search_results:filter_button")).click

    sleep 5
  end
end
end
