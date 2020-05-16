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

    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :css, menu.MENU_BUTTON_TA, menu.MENU_BUTTON_IL
        menu.click_menu_button :ta
      end

      step "User clicks on Menu Category", 'Contact Us' do |value|
        check_element_path :xpath, menu.menu_item(:ta, value), menu.menu_item(:il, value)
        menu.click_menu_item :ta, value
      end

      step "User checks page Header", 'Contact Us' do |title|
        check_element_path :xpath, planetblue.find_page_header(:ta, title),
                           planetblue.find_page_header(:il, title)
        page.execute_script "window.scrollBy(0,700)"
        planetblue.find_page_header :ta, title
      end

      step "User checks Contacts Us Items" do
        check_element_path :xpath,
                           contact_us.contact_us_item(:ta, 'Call Us', 'Mon - Fri : 8 AM PST - 2 PM PST'),
                           contact_us.contact_us_item(:il, 'Call Us', 'Mon - Fri : 8 AM PST - 2 PM PST')
        check_element_path :xpath,
                           contact_us.contact_us_item(:ta, 'Email Us', 'orders@shopplanetblue.com'),
                           contact_us.contact_us_item(:il, 'Email Us', 'orders@shopplanetblue.com')

        contact_us.find_contact_us_item :ta, 'Call Us', 'Mon - Fri : 8 AM PST - 2 PM PST'
        contact_us.find_contact_us_item :ta,'Email Us', 'orders@shopplanetblue.com'
      end

    end

  end
end