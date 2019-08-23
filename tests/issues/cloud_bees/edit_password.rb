require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new
edit_user_page = CloudBeesEditUser.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    step "Remove created user", settings('cloud_bees') do |data|
      page.visit data['login_page']
      login_page.fill_username_field data['username']
      login_page.fill_pass_field data['pass']
      login_page.click_sign_in_button
      page.visit data['users_page']
      users_page.fill_user_filter_field data['user_username']
      users_page.apply_user_filter
      users_page.press_delete_user_btn
      users_page.confirm_user_deletion
    end
    Capybara.current_session.driver.quit
  end

  feature 'TA-1001, TA Analyzer returns the wrong input field in the form when the needed input field is already filled' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
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
        users_page.press_create_user_btn
      end

      step "Admin creates new user", settings('cloud_bees') do |user_data|
        new_user_page.fill_user_name_field user_data['user_username']
        new_user_page.fill_real_name_field user_data['user_realname']
        new_user_page.fill_email_field user_data['user_email']
        new_user_page.fill_password_field user_data['user_password']
        new_user_page.fill_repassword_field user_data['user_password']
        new_user_page.confirm_create_new_user
      end

      step "Admin filters the user", settings('cloud_bees') do |user_data|
        users_page.fill_user_filter_field user_data['user_username']
        users_page.apply_user_filter
      end

      step "Admin presses the Edit user button" do
        users_page.press_edit_user_btn
      end

      step "Admin updates user password", settings('cloud_bees') do |data|
        within_frame(0) do
        fill_in ta('editUser:username'), with: 'eugen_shapovalov1'
        fill_in ta('editUser:email'), with: 'eugene@email.com'
        fill_in ta('editUser:persone'), with: 'asdasdasdasdkasd kjdask jdaskd kjhaskjhaskdhas kdfhaskfhadskfh kfha'
        end

        edit_user_page.fill_admin_password_field :ep, data['pass']
        edit_user_page.fill_new_user_password :ep, data['user_password']
        edit_user_page.fill_new_user_repassword :ep, data['user_password']
        edit_user_page.update_user_data
      end

      sleep 3
    end
  end
end