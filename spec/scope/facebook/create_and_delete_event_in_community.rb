require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
home_page = HomePageFacebook.new
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

  feature 'Creating event and deleting it after'  do

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

        step "User click own community page in shortcuts" do
          home_page.click_own_community_page
        end

        step "User sees Community H1" do
          community_page.should_see_community_h1
        end

        step "User sees Event button" do
          community_page.click_event_btn
        end

        step "User sees Required Info" do
          community_page.should_see_required_info
        end

        step "User fill Event name", "First event" do |value|
          community_page.fill_event_name_input value
        end

        step "User click Online event" do
          community_page.click_online_event_checkbox
        end

        step "User fill Odessa in location field", "odessa\n" do |value|
          community_page.fill_location_event_input value
          community_page.click_just_odessa
        end

        step "User fill description field", "test" do |value|
          community_page.fill_description_field value
        end
        step "User click to select category" do
          community_page.click_select_category
        end

        step "User click to select dance category " do
          community_page.click_dance_category
        end

        step "User click 'Anyone can post' radio-button" do
          community_page.click_anyone_can_post
        end

        step "User click 'Publish' button" do
          community_page.click_publish_btn
        end

        step "User click 'Close' modal button" do
          community_page.click_to_close_modal
        end

        step "User click More settings button" do
          community_page.click_more_settings_for_event
        end

        step "User click Cancel Event button" do
          community_page.click_cancel_event
        end

        step "User click Cancel Event button" do
          community_page.click_delete_event
        end

        step "User click Confirm delete button" do
          community_page.click_confirm_delete_event
        end

        sleep 3
      end
    end

  end
end
