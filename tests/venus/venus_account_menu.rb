require 'spec_helper'
require_relative '../../helpers/special_methods'
require_relative '../../pages/united_methods'
require_relative '../../pages/venus'

include PathCheck
include Venus

describe 'Preconditions' do

before(:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
end

after(:all) do
  Capybara.current_session.driver.quit
end

feature 'TA-734 TA returns the wrong element (Venus - Clicking on the Account menu items)' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do
    step "User goes to the page", settings('venus')['home_page'] do |url|
      page.visit url
    end

    step "User clicks on the Account button" do
      click_account_button
    end

    step "User fills the Email field", settings('venus')['email_field'] do |email|
      fill_email_field email
    end

    step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
      fill_pass_field pass
    end

    step "User clicks on the Sign In button" do
      click_sign_in_button
    end

    step "User clicks on the Account button" do
      click_account_button
    end

    step "User clicks on the Mail Options in the Account menu" do
      click_mail_options
    end

    sleep 3
  end

  scenario 'Searching IL', il_run: true do
    step "User goes to the page", settings('venus')['home_page'] do |url|
      page.visit url
    end

    step "User clicks on the Account button" do
      check_element_path :xpath, @account_button_ta, @account_button_il
      click_account_button
    end

    step "User fills the Email field", settings('venus')['email_field'] do |email|
      check_element_path :id, @email_field_ta, @email_field_il
      fill_email_field email
    end

    step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
      check_element_path :id, @pass_field_ta, @pass_field_il
      fill_pass_field pass
    end

    step "User clicks on the Sign In button" do
      check_element_path :id, @sign_in_btn_ta, @sign_in_btn_il
      click_sign_in_button
    end

    3.times do
      step "User clicks on the Account button" do
        check_element_path :xpath, @account_button_ta, @account_button_il
        click_account_button
      end

      step "User clicks on the Mail Options in the Account menu" do
        check_element_path :xpath, @mail_options_ta, @mail_options_il
        click_mail_options
      end
    end

    sleep 3
  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do
    step "User goes to the page", settings('venus')['home_page'] do |url|
      page.visit url
    end

    step "User clicks on the Account button" do
      check_element_path :xpath, @account_button_ep, @account_button_il
      click_account_button :ep
    end

    step "User fills the Email field", settings('venus')['email_field'] do |email|
      check_element_path :id, @email_field_ep, @email_field_il
      fill_email_field :ep, email
    end

    step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
      check_element_path :id, @pass_field_ep, @pass_field_il
      fill_pass_field :ep, pass
    end

    step "User clicks on the Sign In button" do
      check_element_path :id, @sign_in_btn_ep, @sign_in_btn_il
      click_sign_in_button :ep
    end

    3.times do
      step "User clicks on the Account button" do
        check_element_path :xpath, @account_button_ep, @account_button_il
        click_account_button :ep
      end

      step "User clicks on the Mail Options in the Account menu" do
        check_element_path :xpath, @mail_options_ep, @mail_options_il
        click_mail_options :ep
      end
    end

    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do
    step "User goes to the page", settings('venus')['home_page'] do |url|
      page.visit url
    end

    step "User clicks on the Account button" do
      click_account_button :il
    end

    step "User fills the Email field", settings('venus')['email_field'] do |email|
      fill_email_field :il, email
    end

    step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
      fill_pass_field :il, pass
    end

    step "User clicks on the Sign In button" do
      click_sign_in_button :il
    end

    step "User clicks on the Account button" do
      sleep 2
      click_account_button :il
    end

    step "User clicks on the Mail Options in the Account menu" do
      click_mail_options
    end

    sleep 3
  end

  scenario 'Searching debug', search_debug: true do
    step "User goes to the page", settings('venus')['home_page'] do |url|
      page.visit url
    end

    step "User clicks on the Account button" do
      click_account_button :il
    end

    step "User fills the Email field", settings('venus')['email_field'] do |email|
      fill_email_field :il, email
    end

    step "User fills the Pass field", settings('venus')['pass_field'] do |pass|
      fill_pass_field :il, pass
    end

    step "User clicks on the Sign In button" do
      click_sign_in_button :il
    end

    step "User clicks on the Account button" do
      sleep 2
      click_account_button :il
    end

    step "User clicks on the Mail Options in the Account menu" do
      click_mail_options :il
    end

    step "User clicks on the Account button" do
      sleep 2
      click_account_button :il
    end

    step "User clicks on the Mail Options in the Account menu" do
      click_mail_options
    end


    sleep 3
  end


  end
end
