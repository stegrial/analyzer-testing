require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


faq_page = FaqPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Press page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('flipkart')['faq_page'] do |url|
          page.visit url
        end

        step "User click Log In button " do
          faq_page.click_on_log_in_btn
        end

        step "User click X button to close modal" do
          faq_page.click_close_btn
        end

        step "User click help with issues" do
          faq_page.click_help_with_issues
        end

        step "User sees Incidents breadcrumb" do
          faq_page.should_see_incidents_breadcrumb
        end

        step "User click help with other issues" do
          faq_page.click_help_with_other_issues
        end

        step "User click Manage my order" do
          faq_page.click_manage_my_order
        end

        step "User sees 'Select an item to change address, delivery date, and more'" do
          faq_page.should_see_select_an_item_text
        end

        step "User click Postal Address link" do
          faq_page.click_postal_address
        end

        step "User sees Corporate Address" do
          faq_page.should_see_corporate_address
        end

        step "User click close button" do
          faq_page.click_close_postal_modal_btn
        end
      end
    end
  end
end

