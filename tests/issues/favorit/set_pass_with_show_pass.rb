require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/favorit'

it = Favorit.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-901 Analyzer returns the wrong element (input) in the Sing In section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      it.click_sing_in_button
    end

    step "User clicks on the Show Pass button" do
      it.click_show_pass_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      it.set_pass_with_show_pass pass
    end

    sleep 3
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      check_element_path :xpath, Favorit::SING_IN_BUTTON_TA, Favorit::SING_IN_BUTTON_IL
      it.click_sing_in_button
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      check_element_path :xpath, Favorit::PASS_WITH_SHOW_PASS_TA, Favorit::PASS_IL
      it.set_pass_with_show_pass pass
    end

    sleep 3
  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      check_element_path :xpath, Favorit::SING_IN_BUTTON_EP, Favorit::SING_IN_BUTTON_IL
      it.click_sing_in_button :ep
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      check_element_path :xpath,  Favorit::PASS_WITH_SHOW_PASS_EP, Favorit::PASS_IL
      it.set_pass_with_show_pass :ep, pass
    end
    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      it.click_sing_in_button :il
    end

    step "User clicks on the Show Pass button" do
      it.click_show_pass_button :il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      it.set_pass_with_show_pass pass
    end

    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('favorit')['page'] do |url|
      page.visit url
    end

    step "User clicks on the Sing in button" do
      it.click_sing_in_button :il
    end

    step "User set password in Password field", settings('favorit')['pass'] do |pass|
      it.set_pass_with_show_pass pass
    end
    sleep 3
  end

  end
end