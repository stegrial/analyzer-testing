require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

menu = Menu.new
login = Login.new

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
        end

        step "User clicks Menu Button" do
          menu.click_menu_button
        end

        step "User clicks User Account Button" do
          menu.click_user_button
        end

        step "User fills EMAIL, PASSWORD Fields and clicks 'Login' Button",
             settings('planetblue')['email'],
             settings('planetblue')['pass'] do |email, password|
          scroll_to_element 400
          login.fill_email_field email
          login.fill_password_field password
          login.click_sign_in_button
        end

      end
    end
  end
end