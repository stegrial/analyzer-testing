require 'spec_helper'
require_relative '../../pages/es/united_methods'
require_relative '../../pages/facebook_mobile.rb'
require_relative '../../helpers/special_methods'

it = FacebookMobile.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Facebook - creating and deleting new post in mobile view' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('facebook')['page'] do |url|
      page.visit url
    end

    step "User set login in login field", settings('facebook')['login'] do |login|
      it.set_email login
    end

    step "User set password in password field", settings('facebook')['pass'] do |pass|
      it.set_pass pass
    end

    step "User  clicks on the login button for entering into account" do
      it.click_login_btn
    end

    step "User  clicks Ok" do
      it.click_ok_btn
    end

    step "User  clicks on text-block for creating new post" do
      it.click_new_post
    end

    step "User set text" do
      it.add_text_in_post
    end

    step "User clicks on Post button for publishing" do
      it.click_post_btn
    end

    step "Waiting for publishing" do
      it.expect_publishing
    end

    step "User clicks on multiMenu for selecting setting of new post" do
      it.click_multi_menu
    end

    step "User clicks Delete post" do
      it.deleting_post
    end

    step "User is confirms deleting post" do
      it.confirm_delete
    end
  end

    scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('facebook')['page'] do |url|
        page.visit url
      end

    step "User set login in login field", settings('facebook')['login'] do |login|
      check_element_path :xpath, FacebookMobile::EMAIL_TA, FacebookMobile::EMAIL_IL
      it.set_email login
    end

      step "User set password in password field", settings('facebook')['pass'] do |pass|
        check_element_path :xpath, FacebookMobile::PASS_TA, FacebookMobile::PASS_IL
        it.set_pass pass
      end

      step "User  clicks on the login button for entering into account" do
        check_element_path :xpath, FacebookMobile::LOGIN_BTN_TA, FacebookMobile::LOGIN_BTN_IL
        it.click_login_btn
      end

      step "User  clicks Ok" do
        check_element_path :xpath, FacebookMobile::OK_BTN_TA, FacebookMobile::OK_BTN_IL
        it.click_ok_btn
      end

      step "User  clicks on text-block for creating new post" do
        check_element_path :xpath, FacebookMobile::NEW_POST_TA, FacebookMobile::NEW_POST_IL
        it.click_new_post
      end

      step "User set text" do
        check_element_path :xpath, FacebookMobile::SET_TEXT_TA, FacebookMobile::SET_TEXT_IL
        it.add_text_in_post
      end

      step "User clicks on Post button for publishing" do
        check_element_path :xpath, FacebookMobile::POST_BTN_TA, FacebookMobile::POST_BTN_IL
        it.click_post_btn
      end

      step "Waiting for publishing" do
        it.expect_publishing
      end

      step "User clicks on multiMenu for selecting setting of new post" do
        check_element_path :xpath, FacebookMobile::MULTI_MENU_BTN_TA, FacebookMobile::MULTI_MENU_BTN_IL
        it.click_multi_menu
      end

      step "User clicks Delete post" do
        check_element_path :xpath, FacebookMobile::DELETE_POST_TA, FacebookMobile::DELETE_POST_IL
        it.deleting_post
      end

      step "User is confirms deleting post" do
        check_element_path :xpath, FacebookMobile::CONFIRM_DELETE_TA, FacebookMobile::CONFIRM_DELETE_IL
        confirm_delete
      end
      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('facebook')['page'] do |url|
        page.visit url
      end

      step "User set login in login field", settings('facebook')['login'] do |login|
        check_element_path :xpath, FacebookMobile::EMAIL_EP, FacebookMobile::EMAIL_IL
        it.set_email login, :ep
      end

      step "User set password in password field", settings('facebook')['pass'] do |pass|
        check_element_path :xpath, FacebookMobile::PASS_EP, FacebookMobile::PASS_IL
        it.set_pass pass, :ep
      end

      step "User  clicks on the login button for entering into account" do
        check_element_path :xpath, FacebookMobile::LOGIN_BTN_EP, FacebookMobile::LOGIN_BTN_IL
        it.click_login_btn :ep
      end

      step "User  clicks Ok" do
        check_element_path :xpath, FacebookMobile::OK_BTN_EP, FacebookMobile::OK_BTN_IL
        it.click_ok_btn :ep
      end

      step "User  clicks on text-block for creating new post" do
        check_element_path :xpath, FacebookMobile::NEW_POST_EP, FacebookMobile::NEW_POST_IL
        it.click_new_post :ep
      end

      step "User set text" do
        check_element_path :xpath, FacebookMobile::SET_TEXT_EP, FacebookMobile::SET_TEXT_IL
        it.add_text_in_post :ep
      end

      step "User clicks on Post button for publishing" do
        check_element_path :xpath, FacebookMobile::POST_BTN_EP, FacebookMobile::POST_BTN_IL
        it.click_post_btn :ep
      end

      step "Waiting for publishing" do
        it.expect_publishing
      end

      step "User clicks on multiMenu for selecting setting of new post" do
        check_element_path :xpath, FacebookMobile::MULTI_MENU_BTN_EP, FacebookMobile::MULTI_MENU_BTN_IL
        it.click_multi_menu :ep
      end

      step "User clicks Delete post" do
        check_element_path :xpath, FacebookMobile::DELETE_POST_EP, FacebookMobile::DELETE_POST_IL
        it.deleting_post :ep
      end

      step "User is confirms deleting post" do
        check_element_path :xpath, FacebookMobile::CONFIRM_DELETE_EP, FacebookMobile::CONFIRM_DELETE_IL
        it.confirm_delete :ep
      end
      sleep 3

    end

  end
end