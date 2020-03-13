require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

designers = Designers.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'Planet Blue - Find a Product by Designers' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Designers' do |value|
        designers.click_navbar_link value
      end

      step "User checks page Header", 'Designers' do |title|
        designers.find_page_header title
      end

      step "User checks Designers List Item", '#', 'Y' do |value1, value2|
        designers.find_designers_list_section value1
        designers.find_designers_list_section value2
      end

      step "User clicks Designer Item", '27 MILES MALIBU' do |value|
        designers.click_designers_list_item value
      end

      step "User checks Collection Item",
           'ESSIE CREWNECK SWEATER | New', 'essie-crewneck-sweater?' do |name, link|
        designers.find_collection_item name, link
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Designers' do |value|
        check_element_path(:xpath, menu.click_search_button(:ta),
                           menu.click_search_button(:il))
        designers.click_navbar_link value
      end

      # TODO complete

    end

  end
end