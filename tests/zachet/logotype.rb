require 'spec_helper'
require_relative '../../pages/zachet.rb'
require_relative '../../helpers/special_methods'

include Zachet

feature 'TA-869 Analyzer returns the wrong element (logo) in the Header section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('zachet')['page'] do |url|
      page.visit url
    end

    step "User clicks on the logo" do
      click_logotype
    end

    sleep 3
    Capybara.current_session.driver.quit
  end


  scenario 'Searching IL', il_run: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('zachet')['page'] do |url|
      page.visit url
    end

    step "User clicks on the logo" do
      click_logotype
      check_logotype
    end

    sleep 3
  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('zachet')['page'] do |url|
      page.visit url
    end

    step "User clicks on the logo" do
      ep_click_logotype
    end

    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

    step "User goes to the page", settings('zachet')['page'] do |url|
      page.visit url
    end

    step "User clicks on the logo" do
      click_logotype
    end

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching debug', search_debug: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('zachet')['page'] do |url|
      page.visit url
    end

    step "User clicks on the logo" do
      click_logotype
    end

    sleep 3
  end


end
