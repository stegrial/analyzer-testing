require 'spec_helper'

describe 'Preconditions' do

before(:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  # Capybara.current_session.driver.browser.manage.window.resize_to(320,568)
end

after(:all) do
  Capybara.current_session.driver.quit
  # Capybara.current_session.driver.browser.manage.window.resize_to(1024,640)
end

feature 'TrueAutomation.IO capybara example' do

  scenario 'Clicking on the TOPS item in the Clothing dropdown menu' do
    #to reproduce, just need to increase wait before opening the Clothing dropdown menu

    visit 'https://venus.com'

    # for i in 1..5 #to reproduce several times (good case for performance of tests executing)

    # sleep 2
    # find(:xpath, "//button[contains(., 'Clothing')]").click
    # find(:xpath, ta('venus:clothing_link', "//button[contains(., 'Clothing')]")).click
    find(ta("venus:clothing_link")).click

    # sleep 10 # sleep 2
    # find(:xpath, "//div[@role='button' and text()='Clothing']").click
    # find(:xpath, ta('venus:clothing_section:main_dropdown', "//div[@role='button' and text()='Clothing']")).click
    find(ta("venus:clothing_section:main_dropdown")).click

    sleep 2
    # find(:xpath, "//li[text()='Tops']").click
    # find(:xpath, ta('venus:clothing_section:main_dropdown:tops', "//li[text()='Tops']")).click
    find(ta("venus:clothing_section:main_dropdown:tops")).click #wrong element was found

    # end

    # continuation of the test:

    # sleep 2
    # find(:xpath, "(//div[./input[@id='category-dropdown']]/div)[2]").click
    # find(:xpath, ta('venus:subsection:main_dropdown', "(//div[./input[@id='category-dropdown']]/div)[2]")).click
    find(ta("venus:subsection:main_dropdown")).click

    sleep 5
  end
end
end
