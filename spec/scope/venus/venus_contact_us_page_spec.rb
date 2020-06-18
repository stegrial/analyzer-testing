require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

navigation = VenusNavigation.new
contact_us = ContactUs.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Navigate to Contact Us Page' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['contact_us_page'] do |url|
          page.visit url
        end

        step "User checks page Header", 'Contact Us' do |title|
          navigation.should_see_page_header title
        end

        step "User checks Contacts Us Items" do
          contact_us.should_see_contact_us_item 'Call Us', 'Account Specialists are available by phone 7:00AM EST - 1:00AM EST.'
          contact_us.should_see_contact_us_item 'International callers:', 'Call us with your order. We have Spanish-speaking representatives waiting for your call.'
        end

      end
    end
  end
end