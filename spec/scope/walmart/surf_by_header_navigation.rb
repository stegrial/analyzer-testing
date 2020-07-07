require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

header_nav = HeaderNavigationPageWalmart.new
reorder_page = ReorderPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by header navigation' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User sees Logo on page" do
          header_nav.should_see_logo
        end

        step "User click search dropdown" do
          header_nav.click_search_dropdown_btn
        end

        step "User clicks 'Search In...' text" do
          header_nav.should_see_search_in_text
        end

        step "User clicks 'Home' search item" do
          header_nav.click_home_search_item
        end

        step "User sees Home in search dropdown" do
          header_nav.should_see_home_dropdown_search
        end

        step "User fill search query", "phone" do |value|
          header_nav.fill_search_query value
        end

        step "User clicks Search button" do
          header_nav.click_search_btn
        end

        step "User clicks Reorder link" do
          header_nav.click_reorder_link
        end

        step "User sees Reorder 'Quickly reorder your essentials' text" do
          reorder_page.should_see_quickly_reorder_h2
        end

        step "User clicks Account button" do
          header_nav.click_account_btn
        end

        step "User sees Sign In link" do
          header_nav.should_see_sign_in_link
        end

        step "User sees Track Orders link" do
          header_nav.should_see_track_orders_link
        end

        step "User sees Account link" do
          header_nav.should_see_account_link
        end

        step "User sees Help link" do
          header_nav.should_see_help_link
        end

        step "User click close button" do
          header_nav.click_close_acc_menu
        end

        sleep 3
      end
    end

  end
end
