require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

include ElementSearchValidation

help_page = HelpPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by help page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['help_page'] do |url|
          page.visit url
        end

        step "User sees Help Center H1 " do
          help_page.should_see_help_center_h1
        end

        step "User click 'Where my order?' link " do
          help_page.click_order_truck_link
        end

        step "User sees 'How do I track an order?' h3 " do
          help_page.should_see_how_order_track_h3
        end

        step "User click 'Cancel order' link " do
          help_page.click_cancel_order_link
        end

        step "User sees 'How do I cancel an order?' link " do
          help_page.should_see_how_cancel_order_link
        end

        step "User click 'Pickup & delivery help' link" do
          help_page.click_pickup_delivery_link
        end

        step "User sees 'Frequently Asked Questions' text" do
          help_page.should_see_asked_questions
          page.go_back
        end

        step "User click 'Walmart.com Account' link is left side menu" do
          help_page.click_walmart_account_link
        end

        step "User sees 'Manage Your Account' text" do
          help_page.should_see_manage_your_acc
        end

        step "User click 'Email Communication' link" do
          help_page.click_email_communication
        end

        step "User sees 'Email Communication Types' text" do
          help_page.should_see_email_communication_types
        end

        step "User fill Search field", "Payment Methods" do |value|
          help_page.fill_search_bar value
        end

        step "User click Search icon"  do
          help_page.click_search_icon
        end

        step "User sees Search result line" do
          help_page.should_see_search_result_line
        end
      end
    end
  end
end