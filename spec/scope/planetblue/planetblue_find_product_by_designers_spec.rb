require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
designers = Designers.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Find a Product by Designers' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Designers' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Designers' do |title|
        planetblue.find_page_header title
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
        planetblue.find_collection_item name, link
      end

    end

    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Designers' do |value|
        check_element_path :xpath, planetblue.navbar_link(:ta, value),
                           planetblue.navbar_link(:il, value)
        planetblue.click_navbar_link :ta, value
      end

      step "User checks page Header", 'Designers' do |title|
        check_element_path :xpath, planetblue.page_header(:ta, title),
                           planetblue.page_header(:il, title)
        planetblue.find_page_header :ta, title
      end

      step "User checks Designers List Item", '#', 'Y' do |value1, value2|
        check_element_path :xpath, designers.designers_list_section(:ta, value1),
                           designers.designers_list_section(:il, value1)
        check_element_path :xpath, designers.designers_list_section(:ta, value2),
                           designers.designers_list_section(:il, value2)
        designers.find_designers_list_section :ta, value1
        designers.find_designers_list_section :ta, value2
      end

      step "User clicks Designer Item", '27 MILES MALIBU' do |value|
        check_element_path :xpath, designers.designers_list_item(:ta, value),
                           designers.designers_list_item(:il, value)
        designers.click_designers_list_item :ta, value
      end

      step "User checks Collection Item",
           'ESSIE CREWNECK SWEATER | New', 'essie-crewneck-sweater?' do |name, link|
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, name, link),
                           planetblue.collection_item_by_link(:il, name, link)
        planetblue.find_collection_item :ta, name, link
      end

    end

  end
end