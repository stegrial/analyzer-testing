require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

menu = Menu.new
login = Login.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Login' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
          modal.click_close_continue_shop_button
        end

        step "User clicks User Account Button" do
          menu.click_user_button
          sleep 3 # wait for page load
        end

        step "User fills EMAIL, PASSWORD Fields and clicks 'Login' Button",
             settings('planetblue')['email'],
             settings('planetblue')['pass'] do |email, password|
          login.click_sign_up_close_button
          modal.click_close_policies_button

          login.fill_email_field email
          login.fill_password_field password
          login.click_sign_in_button
        end

        sleep 3
      end
    end

  end
end
