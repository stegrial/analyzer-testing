require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


sell_on_page = SellOnFlipkartPage.new
header_nav = HeaderNavigationFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Sell on Flipkart page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('flipkart')['main_page'] do |url|
          page.visit url
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User hover More dropdown" do
          header_nav.hover_more_dropdown
        end

        step "User click Sell on Flipkart" do
          sell_on_page.click_sell_on_link
        end

        step "User Login for existing sellers" do
          sell_on_page.click_login_existing_sellers
        end

        step "User fill username input", "tester" do |value|
          sell_on_page.fill_username_input value
        end

        step "User fill password input", "test" do |value|
          sell_on_page.fill_password_input value
        end

        step "User fill username input" do
          sell_on_page.click_login_btn
        end

        step "User click close modal button" do
          sell_on_page.click_close_modal_btn
        end

        step "User click How To Register tab" do
          sell_on_page.click_how_to_register_tab
        end

        step "User sees Register btn in How To Register tab" do
          sell_on_page.should_see_register_btn
        end

        step "User click Sell Online tab " do
          sell_on_page.click_why_sell_online_tab
        end

        step "User click Learn more in Sell Online tab " do
          sell_on_page.click_learn_more_link
        end

        step "User click onboarding text on page" do
          sell_on_page.should_see_onboarding_text
          page.go_back
        end

        step "User click Know more" do
          sell_on_page.click_know_more_link
        end

        step "User click Growth text on page" do
          sell_on_page.should_see_growth_text
        end
      end
    end
  end
end

