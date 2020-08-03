require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/facebook/*.rb"

header_nav = HeaderNaviPageFacebook.new
search_page = SearchPageFacebook.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Search for new friends'  do

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

        step "User fill search field in header navigation", "Ivan\n" do |value|
          header_nav.fill_search_input value
        end

        step "User sees page with search result" do
          search_page.should_see_search_results
        end

        step "User sees Like button in first block of person" do
          search_page.should_see_add_friend_btn
        end

        step "User click People search navigation tab" do
          search_page.click_people_tabs
        end

        step "User sees Friends of friends filter in left-side bar" do
          search_page.should_see_friends_of_friends_filter
        end

        step "User click Groups search navigation tab" do
          search_page.click_groups_tab
        end

        step "User click public group radio-button" do
          search_page.click_public_group_btn
        end

        step "User click Photos navigation tab " do
          search_page.click_photos_tab
        end

        step "User sees Public photos block" do
          search_page.should_see_public_photos
        end

        step "User click See All link" do
          search_page.click_see_all_link
        end

        sleep 3
      end
    end

  end
end
