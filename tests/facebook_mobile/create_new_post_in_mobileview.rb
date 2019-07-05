require 'spec_helper'
require_relative '../../pages/united_methods'
require_relative '../../pages/facebook_mobile.rb'
require_relative '../../helpers/special_methods'

include PathCheck
include FacebookMobile

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('facebook')['page'] do |url|
      page.visit url
    end

    step "User set login in login field", settings('facebook')['login'] do |login|
      set_email login
    end

    step "User set password in password field", settings('facebook')['pass'] do |pass|
      set_pass pass
    end

    step "User  clicks on the login button for entering into account" do
      click_login_btn
    end

    step "User  clicks Ok" do
      click_ok_btn
    end

    step "User  clicks on text-block for creating new post" do
      click_new_post
    end

    step "User set text" do
      add_text_in_post
    end

    step "User clicks on Post button for publishing" do
      click_post_btn
    end

    step "Waiting for publishing" do
      expect_publishing
    end

    step "User clicks on multiMenu for selecting setting of new post" do
      click_multi_menu
    end

    step "User clicks Delete post" do
      deleting_post
    end

    step "User is confirms deleting post" do
      confirm_delete
    end
  end

    scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('facebook')['page'] do |url|
        page.visit url
      end

    step "User set login in login field", settings('facebook')['login'] do |login|
      check_element_path @email_ta, @email_il
      set_email login
    end

      step "User set password in password field", settings('facebook')['pass'] do |pass|
        check_element_path @pass_ta, @pass_il
        set_pass pass
      end

      step "User  clicks on the login button for entering into account" do
        check_element_path @login_btn_ta, @login_btn_il
        click_login_btn
      end

      step "User  clicks Ok" do
        check_element_path @ok_btn_ta, @ok_btn_il
        click_ok_btn
      end

      step "User  clicks on text-block for creating new post" do
        check_element_path @new_post_ta, @new_post_il
        click_new_post
      end

      step "User set text" do
        check_element_path @set_text_ta, @set_text_il
        add_text_in_post
      end

      step "User clicks on Post button for publishing" do
        check_element_path @post_btn_ta, @post_btn_il
        click_post_btn
      end

      step "Waiting for publishing" do
        expect_publishing
      end

      step "User clicks on multiMenu for selecting setting of new post" do
        check_element_path @multi_menu_btn_ta, @multi_menu_btn_il
        click_multi_menu
      end

      step "User clicks Delete post" do
        check_element_path @delete_post_ta, @delete_post_il
        deleting_post
      end

      step "User is confirms deleting post" do
        check_element_path @confirm_delete_ta, @confirm_delete_il
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
        check_element_path @email_ep, @email_il
        set_email login, :ep
      end

      step "User set password in password field", settings('facebook')['pass'] do |pass|
        check_element_path @pass_ep, @pass_il
        set_pass pass, :ep
      end

      step "User  clicks on the login button for entering into account" do
        check_element_path @login_btn_ep, @login_btn_il
        click_login_btn :ep
      end

      step "User  clicks Ok" do
        check_element_path @ok_btn_ep, @ok_btn_il
        click_ok_btn :ep
      end

      step "User  clicks on text-block for creating new post" do
        check_element_path @new_post_ep, @new_post_il
        click_new_post :ep
      end

      step "User set text" do
        check_element_path @set_text_ep, @set_text_il
        add_text_in_post :ep
      end

      step "User clicks on Post button for publishing" do
        check_element_path @post_btn_ep, @post_btn_il
        click_post_btn :ep
      end

      step "Waiting for publishing" do
        expect_publishing
      end

      step "User clicks on multiMenu for selecting setting of new post" do
        check_element_path @multi_menu_btn_ep, @multi_menu_btn_il
        click_multi_menu :ep
      end

      step "User clicks Delete post" do
        check_element_path @delete_post_ep, @delete_post_il
        deleting_post :ep
      end

      step "User is confirms deleting post" do
        check_element_path @confirm_delete_ep, @confirm_delete_il
        confirm_delete :ep
      end
      sleep 3

    end

  end
end