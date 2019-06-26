require 'spec_helper'
require_relative '../../pages/how_to_get_money.rb'
require_relative '../../helpers/special_methods'

include HowToGetMoney

feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

  # Recording

  scenario 'Recording by initial locators', rec_run: true do

    step "User goes to the page", settings('how_to_get_money')['page'] do |url|
      page.visit url
    end

    step "User clicks on the link - First loan" do
      click_first_loan_link
    end

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching when initial locators used', rec_run: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('how_to_get_money')['page'] do |url|
      page.visit url
    end

    step "User clicks on the link - First loan" do
      click_first_loan_link
      check_first_loan_link
    end

    sleep 3
  end

  # Repository

  scenario 'Searching when Element Picker used', repo_run: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('how_to_get_money')['page'] do |url|
      page.visit url
    end

    step "User clicks on the link - First loan" do
      ep_click_first_loan_link
    end

    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

    step "User goes to the page", settings('how_to_get_money')['page'] do |url|
      page.visit url
    end

    step "User clicks on the link - First loan" do
      click_first_loan_link
    end

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching debug', search_debug: true do

    step "User resizes browser window to maximum" do
      Capybara.current_session.driver.browser.manage.window.maximize
    end

    step "User goes to the page", settings('how_to_get_money')['page'] do |url|
      page.visit url
    end

    step "User clicks on the link - First loan" do
      click_first_loan_link
    end

    sleep 3
  end


end
