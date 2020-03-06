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
  scenario 'Clicking by About Us button in footer' do

    visit 'https://www.venus.com'

    # sleep 10
    # find(:xpath, "(//li[./div[text()='About Us']])[1]").click
    # find(:xpath, ta('venus:main:aboutus_btn', "(//li[./div[text()='About Us']])[1]")).click
    find(ta("venus:main:aboutus_btn")).click

    sleep 5
  end
end
end
