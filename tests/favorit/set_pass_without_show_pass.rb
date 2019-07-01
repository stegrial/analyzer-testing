require 'spec_helper'
require_relative '../../pages/favorit.rb'
require_relative '../../helpers/special_methods'

include Favorit

feature 'Analyzer returns the wrong element (input) in the Sing In section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
    end

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button
    end

    step "User clicks on the Show Pass button" do
      click_show_pass_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
      check_pass_without_show_pass
    end

    sleep 3
  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      ep_click_sign_in_button
    end

    step "User clicks on the Show Pass button" do
      ep_click_show_pass_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      ep_set_pass_without_show_pass pass
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button_il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
    end

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      click_sing_in_button_il
    end

    step "User clicks on the Show Pass button" do
      click_show_pass_button_il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      set_pass_without_show_pass pass
      check_pass_without_show_pass
    end
    sleep 3
  end



end