require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
community_page = CommunityPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Search and browse TA community, write a msg to community'  do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('facebook')['main_page'] do |url|
          page.visit url
        end

        step "User set login in login field", settings('facebook')['login'] do |value|
          header_nav.set_email value
        end

        step "User set password in password field", settings('facebook')['pass'] do |value|
          header_nav.set_pass value
        end

        step "User  clicks on the login button for entering into account" do
          header_nav.click_login_btn
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User fill search field in header navigation", "TrueAutomation\n" do |value|
          header_nav.fill_search_input value
        end

        step "User click TrueAutomation community" do
          community_page.click_ta_community
        end

        step "User sees @trueautomation - on Facebook or in Messenger to find this Page easily." do
          community_page.should_see_easy_ta_search
        end

        step "User click About link in left side navigation" do
          community_page.click_about_ta
        end

        step "User sees Contact Info text" do
          community_page.should_see_contact_info_text
        end

        step "User click Suggest Edits link" do
          community_page.click_suggest_edits
        end

        step "User sees Basic Info text" do
          community_page.should_see_basic_info_test
        end

        step "User click Add Duplicate URL btn" do
          community_page.click_add_duplicate_url
        end

        step "User sees URL Info" do
          community_page.should_see_url_info
        end

        step "User click to close dialog button" do
          community_page.click_dialog_close_button
        end

        step "User click Send Message button" do
          community_page.click_send_msg_btn
        end

        step "User click sees chat modal" do
          community_page.should_see_chat_modal
        end

        step "User click fill Type a Message field", "test" do |value|
          community_page.fill_type_a_message_field value
        end

        step "User click close chat button" do
          community_page.click_close_chat
        end

        sleep 3
      end
    end

  end
end
