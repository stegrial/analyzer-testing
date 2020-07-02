require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

customer_care_page = CustomerCarePage.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Navigate to Customer Care Page' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['customer_care_page'] do |url|
          page.visit url
        end

        step "User checks links", 'FAQ' do |link|
          customer_care_page.should_see_link link
        end

        step "User checks links", 'Track My Order' do |link|
          customer_care_page.should_see_link link
        end

        step "User checks links", 'Order Status' do |link|
          customer_care_page.should_see_link link
        end

        step "User checks links", 'Contact Us' do |link|
          customer_care_page.should_see_link link
        end

      end
    end
  end
end