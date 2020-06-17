require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
contact_us = ContactUs.new
menu = Menu.new
modal = Modal.new

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

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks on Menu button" do
          menu.click_menu_button
        end

        step "User clicks on Menu Category", 'Contact Us' do |value|
          menu.click_menu_item value
          modal.click_close_policies_button
        end

        step "User checks page Header", 'Contact Us' do |title|
          scroll_to_element 700
          planetblue.should_see_page_header title
        end

        step "User checks Contacts Us Items" do
          contact_us.should_see_contact_us_item 'Call Us', 'Mon - Thu : 8 AM PST - 2 PM PST'
          contact_us.should_see_contact_us_item 'Email Us', 'orders@shopplanetblue.com'
        end

        sleep 3
      end
    end

  end
end
