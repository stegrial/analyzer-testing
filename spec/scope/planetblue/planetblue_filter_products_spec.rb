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


  feature 'Planet Blue - Filter Products' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'LOUNGEwear' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Loungewear' do |title|
        planetblue.find_page_header title
      end

      step "User checks Collection Items", 'CAMO PULLOVER | New', 'camo-pullover?' do |name, link|
        planetblue.find_collection_item name, link
      end

      step "User selects Refine Category Dropdown values", 'Category',
           [ 'Rompers + Jumpsuits', 'Shorts' ]  do |section, values|
        planetblue.select_from_refine_dropdown section, values
      end

      step "User checks Collection Items"  do
        planetblue.find_collection_item 'BRITTON JUMPSUIT', 'britton-jumpsuit?'
        planetblue.find_collection_item 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?'
      end

    end

    scenario 'Searching Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'LOUNGEwear' do |value|
        check_element_path :xpath, planetblue.navbar_link(:ta, value),
                           planetblue.navbar_link(:il, value)
        planetblue.click_navbar_link :ta, value
      end

      step "User checks page Header", 'Loungewear' do |title|
        check_element_path :xpath, planetblue.page_header(:ta, value),
                           planetblue.page_header(:il, value)
        planetblue.find_page_header :ta, title
      end

      step "User checks Collection Items", 'CAMO PULLOVER | New', 'camo-pullover?' do |name, link|
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, name, link),
                           planetblue.collection_item_by_link(:il, name, link)
        planetblue.find_collection_item :ta, name, link
      end

      step "User selects Refine Category Dropdown values", 'Category',
           [ 'Rompers + Jumpsuits', 'Shorts' ]  do |section, values|
        check_element_path :xpath, planetblue.category_dropdown(:ta, 'REFINE'),
                           planetblue.category_dropdown(:il, 'REFINE')
        check_element_path :xpath, planetblue.refine_category_block(:ta, 'Category'),
                           planetblue.refine_category_block(:il, 'Category')
        check_element_path :xpath, planetblue.refine_dropdown_checkbox(:ta, 'Category', 'Rompers + Jumpsuits'),
                           planetblue.refine_dropdown_checkbox(:il, 'Category', 'Rompers + Jumpsuits')
        check_element_path :css, planetblue.CLOSE_DROPDOWN_BUTTON_TA, planetblue.CLOSE_DROPDOWN_BUTTON_IL
        check_element_path :css, planetblue.APPLY_BUTTON_TA, planetblue.APPLY_BUTTON_IL
        planetblue.select_from_refine_dropdown :ta, section, values
      end

      step "User checks Collection Items"  do
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, 'BRITTON JUMPSUIT', 'britton-jumpsuit?'),
                           planetblue.collection_item_by_link(:il, 'BRITTON JUMPSUIT', 'britton-jumpsuit?')
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?'),
                           planetblue.collection_item_by_link(:il, 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?')
        planetblue.find_collection_item :ta, 'BRITTON JUMPSUIT', 'britton-jumpsuit?'
        planetblue.find_collection_item :ta, 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?'
      end

    end

  end
end