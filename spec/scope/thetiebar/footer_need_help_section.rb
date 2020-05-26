require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

footer_page = TheTiebarFooterPage.new
faq_page = TheTiebarFaqPage.new
about_us_page = TheTiebarAboutUs.new
canada_page = TheTiebarCanada.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Footer: Need help? section' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User clicks on the Contact link" do
          footer_page.click_contact
          footer_page.should_see_contact_h1
        end

        step "User clicks on the Shipping link" do
          footer_page.click_shipping
          footer_page.should_see_shipping_h1
        end

        step "User clicks on the Returns link" do
          footer_page.click_returns
          footer_page.should_see_returns_h1
        end

        step "User clicks on the Track My Order link" do
          footer_page.click_track_my_orders
          footer_page.should_see_track_my_order_h1
        end

        step "User clicks on the About Us link" do
          footer_page.click_about_us
          footer_page.should_see_about_us_h1
        end

        step "User clicks on the About Us Stores link" do
          footer_page.click_about_our_stores
          about_us_page.should_see_about_our_stores_h1
        end

        step "User clicks on the FAQ link" do
          footer_page.click_faq
          footer_page.should_see_faq_h1
        end

        step "User clicks on return to the tiebar link in top" do
          faq_page.click_return_to_the_tiebar
        end

        step "User clicks on the Careers link" do
          footer_page.click_careers
          footer_page.should_see_current_posittions_h1
        end

        step "User clicks on the Canada link" do
          footer_page.click_canada
          canada_page.should_see_canada_h1
        end

        step "User clicks on the Promotions link" do
          footer_page.click_promotions
          footer_page.should_see_promotions_h1
        end

        sleep 3
      end
    end

  end
end
