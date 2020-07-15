require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

include ElementSearchValidation

header_nav = HeaderNaviPageFacebook.new
home_page = HomePageFacebook.new
profile_page = ProfilePageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating a story and deleting it after'  do

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

        step "User click Add to Your Story" do
          home_page.click_add_to_your_story
        end

        step "User click on More Options button" do
          home_page.click_more_options_btn
        end

        step "User click on News Feed radio-button" do
          home_page.click_news_feed_radio_btn
        end

        step "User click on Watch Party button" do
          home_page.click_watch_party_btn
        end

        step "User click My Videos tab" do
          home_page.click_my_videos_tab
        end

        step "User click Add to Queue button" do
          home_page.click_add_to_queue_btn
        end

        step "User click Done button" do
          home_page.click_done_btn
        end

        step "User click Post button" do
          home_page.click_post_btn
        end

        step "User sees Chat modal is present on page" do
          home_page.should_see_chat_modal
        end

        step "User click Profile button" do
          header_nav.click_profile_btn
        end

        step "User click Leave This Page button" do
          home_page.click_leave_this_page_btn
        end

        step "User  click to open story option" do
          profile_page.click_to_open_story_option
        end

        step "User  click Delete " do
          profile_page.click_to_delete_post
        end

        step "User  click to accept delete post" do
          profile_page.click_to_accept_delete_post
        end
      end
    end
  end
end
