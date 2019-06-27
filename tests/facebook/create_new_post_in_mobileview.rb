require 'spec_helper'
require_relative '../../pages/facebook_mobile.rb'
require_relative '../../helpers/special_methods'

include FacebookMobile

describe 'Preconditions' do

before(:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
end

feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

  # Recording

  scenario 'Recording by initial locators', rec_run: true do

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

    step "User set text", settings('facebook')['new_post'] do |text|
      add_text_in_post text
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

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching when initial locators used', rec_run: true do

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

    step "User set text", settings('facebook')['new_post'] do |text|
      add_text_in_post text
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
    sleep 3
  end

  # Repository

  scenario 'Searching when Element Picker used', repo_run: true do
    step "User goes to the page", settings('facebook')['page'] do |url|
      page.visit url
    end

    step "User set login in login field", settings('facebook')['login'] do |login|
      ep_set_email login
    end

    step "User set password in password field", settings('facebook')['pass'] do |pass|
      ep_set_pass pass
    end

    step "User  clicks on the login button for entering into account" do
      ep_click_login_btn
    end

    step "User  clicks Ok" do
     ep_click_ok_btn
    end

    step "User  clicks on text-block for creating new post" do
      ep_click_new_post
    end

    step "User set text", settings('facebook')['new_post'] do |text|
      ep_add_text_in_post text
    end

    step "User clicks on Post button for publishing" do
      ep_click_post_btn
    end

    step "Waiting for publishing" do
      expect_publishing
    end

    step "User clicks on multiMenu for selecting setting of new post" do
      ep_click_multi_menu
    end

    step "User clicks Delete post" do
      ep_deleting_post
    end

    step "User is confirms deleting post" do
      ep_confirm_delete
    end

    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

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

    step "User set text", settings('facebook')['new_post'] do |text|
      add_text_in_post text
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

    sleep 3
    Capybara.current_session.driver.quit
  end

  scenario 'Searching debug', search_debug: true do

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

    step "User set text", settings('facebook')['new_post'] do |text|
      add_text_in_post text
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

    sleep 3
  end

end
  end