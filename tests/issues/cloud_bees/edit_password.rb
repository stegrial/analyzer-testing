require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees_pages/cloud_bees_global'

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
users_page = CloudBeesUsers.new
new_user_page = CloudBeesNewUser.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-1001, TA Analyzer returns the wrong input field in the form when the needed input field is already filled' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('cloud_bees') do |credentials|
        it.fill_username_field credentials['username']
        it.fill_pass_field credentials['pass']
        it.click_sign_in_button
      end

      step "User clicks on the Hamburger menu button" do
        it.click_hamburger_menu
      end

      step "User chooses the Users section in the Hamburger menu" do
        it.choose_users_section
      end

      # step "User presses the Create Local User button" do
      #   it.press_create_user_btn
      # end

      # step "Admin create new user", settings('cloud_bees') do |user_data|
      #   it.fill_new_user_name_field user_data['new_username']
      #   it.fill_new_real_name_field user_data['new_realname']
      #   it.fill_new_email_field user_data['new_email']
      #   it.fill_new_password_field user_data['new_password']
      #   it.fill_new_repassword_field user_data['new_password']
      #   it.confirm_create_new_user
      # end

      step "Admin filter the user", settings('cloud_bees') do |user_data|
        it.fill_user_filter_field user_data['new_username']
        it.apply_user_filter
      end

      step "Admin presses the Edit user button" do
        it.press_edit_user_btn
      end

      step "Admin updates user password", settings('cloud_bees') do |data|
       # within_frame 0 do
          # fill_in ta('editUser:username'), with: 'NewEugene'
          # fill_in ta('editUser:email'), with: 'eugene@email.com'
          # fill_in ta('editUser:persone'), with: 'asdasdasdasdkasd kjdask jdaskd kjhaskjhaskdhas kdfhaskfhadskfh kfha'

          # fill_in ta('editUser:password'), with: 'password'
          # fill_in ta('editUser:newPassword'), with: 'newpassword'
          # fill_in ta('editUser:retypePassword'), with: 'newpassword'
       # end


        it.fill_admin_password_field data['pass']
        it.update_user_password data['new_password']
        it.update_user_repassword data['new_password']


        it.apply_new_user_data
      end

      sleep 3
    end
  end
end