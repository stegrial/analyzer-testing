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
  scenario 'Clicking on the S-size checkbox in the Filter dropdown menu' do
    #to reproduce, just need to increase wait before opening the Clothing dropdown menu

    visit 'https://venus-preprod.moovweb.cloud'

    # sleep 10
    # find(:xpath, "//button[contains(., 'Clothing')]").click
    find(:xpath, ta('venus:clothing_link', "//button[contains(., 'Clothing')]")).click
    # find(ta("venus:clothing_link")).click

    # sleep 10 # sleep 2
    # find(:xpath, "//div[@role='button' and text()='Clothing']").click
    find(:xpath, ta('venus:clothing_section:main_dropdown', "//div[@role='button' and text()='Clothing']")).click
    # find(ta("venus:clothing_section:main_dropdown")).click

    # sleep 5
    # find(:xpath, "//li[text()='Tops']").click
    find(:xpath, ta('venus:clothing_section:main_dropdown:tops', "//li[text()='Tops']")).click
    # find(ta("venus:clothing_section:main_dropdown:tops")).click

    # sleep 5
    # find(:xpath, "//button[.//span[text()='Filter']]").click
    find(:xpath, ta('venus:subsection:filter', "//button[.//span[text()='Filter']]")).click
    # find(ta("venus:subsection:filter")).click

    # sleep 5
    # find(:xpath, "//label[.//span[text()='S (4-6)']]").click
    find(:xpath, ta('venus:subsection:filter:S', "//label[.//span[text()='S (4-6)']]")).click
    # find(ta("venus:subsection:filter:S")).click # wrong element was found

    # sleep 5
    # find(:xpath, "//button[contains(., 'View Results')]").click
    find(:xpath, ta('venus:subsection:filter:view_results', "//button[contains(., 'View Results')]")).click
    # find(ta("venus:subsection:filter:view_results")).click

    sleep 5
  end
end
end
