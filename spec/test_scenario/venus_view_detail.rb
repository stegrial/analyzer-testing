require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Clicking on the View detail link after the search' do
    #element (view detail) is recorded before user is logged in
    #but the problem is reproduced after user autorization!

    visit 'https://venus-preprod.moovweb.net'

    sleep 10
    find(:xpath, ("(//button[@aria-label='Account'])[1]")).click
    # find(:xpath, ta('venus:account_button', "(//button[@aria-label='Account'])[1]")).click
    # find(ta("venus:account_button")).click

    sleep 10
    find(:id, ('ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # find(:id, ta('venus:email_field', 'ctl00_Body1_loginemail')).set('denys.shutko@moovweb.com')
    # find(ta("venus:email_field")).set('denys.shutko@moovweb.com')

    sleep 10
    find(:id, ('ctl00_Body1_loginpassword')).set('asdffdsA1')
    # find(:id, ta('venus:pass_field', 'ctl00_Body1_loginpassword')).set('asdffdsA1')
    # find(ta("venus:pass_field")).set('asdffdsA1')

    sleep 10
    find(:id, ('ctl00_Body1_loginbutton')).click
    # find(:id, ta('venus:signin_btn', 'ctl00_Body1_loginbutton')).click
    # find(ta("venus:signin_btn")).click

    sleep 10
    find(:xpath, "//button[@aria-label='Search']").click
    # find(:xpath, ta('venus:main:search_button', "//button[@aria-label='Search']")).click
    # find(ta("venus:main:search_button")).click

    sleep 10
    find(:xpath, "//input[contains (@placeholder, 'Search')]").set('white')
    # find(:xpath, ta('venus:search_page:search_field', "//input[contains (@placeholder, 'Search')]")).set('white')
    # find(ta("venus:search_page:search_field")).set('white')

    sleep 10
    find(:xpath, "//button[@variant='raised']").click
    # find(:xpath, ta('venus:search_page:search_button', "//button[@variant='raised']")).click
    # find(ta("venus:search_page:search_button")).click

    sleep 10
    # find(:xpath, "(//span[text()='view detail'])[2]").click
    find(:xpath, ta('venus:search_results:view_detail', "(//span[text()='view detail'])[2]")).click
    # find(ta("venus:search_results:view_detail")).click

    sleep 5
  end
end
