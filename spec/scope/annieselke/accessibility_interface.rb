require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/annieselke/*.rb"

ai_page = AccessibilityInterfacePage.new
banner_page = BannerPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Navigation and adding product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
        end

        step "Close banners" do
          banner_page.close_banner
          banner_page.close_cupon_banner
        end

        step "User clicks accessibility interface button" do
          ai_page.click_accessibility_interface
        end

        step "User clicks language" do
          ai_page.click_language
        end

        step "User clicks close language list" do
          ai_page.click_close_language_list
        end

        step "User clicks hide interface button" do
          ai_page.click_hide_interface
        end

        step "User clicks cancel button" do
          ai_page.click_cancel_btn
        end

        step "Close banners" do
          banner_page.close_cupon_banner
        end

        step "User clicks change interface position" do
          ai_page.click_interface_position
        end

        step "User clicks stop animations" do
          ai_page.click_stop_animations
        end

        step "User clicks readable font button" do
          ai_page.click_readable_font
        end

        step "User clicks invert contrast" do
          ai_page.click_invert_contrast
        end

        step "User clicks feedback button" do
          ai_page.click_feedback
        end

        step "User clicks", "test_name" do |value|
          ai_page.fill_full_name(value)
        end

        step "User clicks", "test@email.com" do |value|
          ai_page.fill_email_address(value)
        end

        step "User clicks", "380911234567" do |value|
          ai_page.fill_phone_number(value)
        end

        step "User clicks", "test text" do |value|
          ai_page.fill_your_feedback(value)
        end

        step "User clicks" do
          ai_page.click_agreement_checkbox
        end

        step "User clicks" do
          ai_page.click_send_feedback
        end

        sleep 3
      end
    end

  end
end
