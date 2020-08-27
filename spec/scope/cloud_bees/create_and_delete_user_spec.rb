require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating and Deleting user' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
          page.visit url
        end

        step "Admin do login", settings('cloud_bees') do |credentials|
          login_page.fill_username_field credentials['username']
          login_page.fill_pass_field credentials['pass']
          login_page.click_sign_in_button
        end

        step "Admin clicks on the Hamburger menu button" do
          global_page.click_hamburger_menu
        end

        step "Admin chooses the Users section in the Hamburger menu" do
          global_page.choose_users_section
        end

        step "Admin presses the Create Local User button" do
          sleep 3 # to waiting iframe
          users_page.press_create_user_btn
        end

        step "Admin fills the User Name field", 'Car' do |name|
          sleep 3 # to waiting iframe
          new_user_page.fill_user_name_field name
        end

        step "Admin fills the Real Name field", 'CarCar' do |name|
          new_user_page.fill_real_name_field name
        end

        step "Admin fills the Email field", 'CarCar@email.com' do |name|
          new_user_page.fill_email_field name
        end

        step "Admin fills the Password field", 'pass' do |name|
          new_user_page.fill_password_field name
        end

        step "Admin fills the Retype Password field", 'pass' do |name|
          new_user_page.fill_repassword_field name
        end

        step "Admin confirms create new user" do
          new_user_page.confirm_create_new_user
        end

        step "Admin fills the filter field", 'Car' do |user_username|
          users_page.fill_user_filter_field user_username
        end

        step "Admin filters the user" do
          users_page.apply_user_filter
        end

        step "Admin clicks on deleting user" do
          users_page.press_delete_user_btn
        end

        step "Admin clicks on confirm deleting user" do
          users_page.confirm_user_deletion
        end

        sleep 3
      end
    end

  end
end
