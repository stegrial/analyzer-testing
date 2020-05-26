require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
contact_us = ContactUs.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Navigate to Contact Us Page' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        menu.click_menu_button
      end

      step "User clicks on Menu Category", 'Contact Us' do |value|
        menu.click_menu_item value
      end

      step "User checks page Header", 'Contact Us' do |title|
        page.execute_script "window.scrollBy(0,700)"
        planetblue.find_page_header title
      end

      step "User checks Contacts Us Items" do
        contact_us.find_contact_us_item 'Call Us', 'Mon - Thu : 8 AM PST - 2 PM PST'
        contact_us.find_contact_us_item 'Email Us', 'orders@shopplanetblue.com'
      end

    end
  end
end