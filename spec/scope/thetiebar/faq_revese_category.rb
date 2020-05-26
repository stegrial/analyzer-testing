require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

faq_page = TheTiebarFaqPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'FAQ page -  revise Categories' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
          page.visit url
        end

        step "User clicks international section" do
          faq_page.click_international_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks about the tiebar section" do
          faq_page.click_about_the_tiebar_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks sizing section" do
          faq_page.click_sizing_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks products section" do
          faq_page.click_products_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks styling section" do
          faq_page.click_styling_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks bulk wholysale section" do
          faq_page.click_bulk_wholesale_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks products section" do
          faq_page.click_returns_payment_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks shipping section" do
          faq_page.click_shipping_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar :il # step is duplicated below
        end

        step "User clicks holiday section" do
          faq_page.click_holiday_section
        end

        step "User breadcrumb tiebar" do
          faq_page.click_breadcrumb_tiebar
        end

        sleep 3
      end
    end

  end
end
