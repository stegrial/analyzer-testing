require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
home_page = HomePageFacebook.new
chat_page = ChatPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by messenger'  do

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

        step "Click Messenger link" do
          home_page.click_messenger_link
        end

        step "User sees Chats text" do
          chat_page.should_see_chats_text
        end

        step "Need to press escape" do
          header_nav.escape :il #step is duplicated below
        end

        step "User fill search field", "Mark Soza" do |value|
          chat_page.fill_search_input value
          sleep 3 # wait for filter apply
        end

        step "User sees Contacts in left side chat menu" do
          chat_page.should_see_contacts_in_chat :il #step is duplicated below
        end

        step "User sees Businesses in left side chat menu" do
          chat_page.should_see_businesses_in_chat
        end

        step "User click X btn for clear search field" do
          chat_page.click_clear_search_field
        end

        step "User click to start chat with Mark Soza" do
          chat_page.click_to_start_chat_mark_soza
        end

        step "User click Choose an emoji button" do
          chat_page.click_choose_an_emoji
        end

        step "User click to select Emoji button" do
          chat_page.click_select_emoji
        end

        step "User click Send Msg button" do
          chat_page.click_send_msg
        end

        step "User sees More Actions in right side menu" do
          chat_page.should_see_more_actions
        end

        step "User sees Privacy and Support button in right side menu" do
          chat_page.should_see_privacy_support_btn
        end

        sleep 3
      end
    end

  end
end
