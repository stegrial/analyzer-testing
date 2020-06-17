require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"


header_navigation = HeaderNavigation.new
help_page = HelpPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Deals and Promotions page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on deals today button" do
          header_navigation.click_customer_service_btn
        end

        step "User sees main text on page" do
          help_page.should_see_main_text_on_page
        end

        step "User sees your orders block" do
          help_page.should_see_your_orders
        end

        step "User sees your account block" do
          help_page.should_see_your_account
        end

        step "User sees manage prime block" do
          help_page.should_see_manage_prime
        end

        step "User fill search field ", "order" do |value|
          help_page.fill_help_search_field value
        end

        step "User clicks Go button" do
          help_page.user_click_go_button
        end

        step "User sees 'Help&Customer Service' text" do
          help_page.should_see_help_customer_service
        end

        step "User sees 'Help Topics' text" do
          help_page.should_see_help_topics
        end

        step "User sees 'Quick Solutions' text" do
          help_page.should_see_quick_solutions
        end
      end
    end
  end
end
