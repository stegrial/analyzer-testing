require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Purchase Product' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url # https://shopplanetblue.com/products/the-jessie-midi-2?variant=31773312122964
      end

      #

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :css, PlanetBlue::MENU_BUTTON_TA, PlanetBlue::MENU_BUTTON_IL
        menu.click_menu_button :ta
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        check_element_path :xpath, menu.menu_category(:ta, value),
                           menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        check_element_path :xpath, menu.menu_category(:ta, value),
                           menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        check_element_path :xpath, menu.menu_category(:ta, value),
                           menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        check_element_path :xpath, planetblue.category_dropdown(:ta, value1),
                           planetblue.category_dropdown(:il, value1)
        check_element_path :xpath, planetblue.category_dropdown(:ta, value2),
                           planetblue.category_dropdown(:il, value2)
        planetblue.find_category_dropdown :ta, value1
        planetblue.find_category_dropdown :ta, value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|
        check_element_path(:xpath, planetblue.collection_item_link(:ta, name),
                           planetblue.collection_item_link(:il, name))
        check_element_path(:xpath, planetblue.collection_item_title(:ta, name),
                           planetblue.collection_item_title(:li, name))
        check_element_path(:xpath, planetblue.collection_item_image(:ta, name),
                           planetblue.collection_item_image(:li, name))
        check_element_path(:xpath, planetblue.collection_item_price(:ta, name),
                           planetblue.collection_item_price(:li, name))
        check_element_path(:xpath, planetblue.collection_item_color(:ta, name, color),
                           planetblue.find_collection_item(:li, name, color).locator)
        planetblue.find_collection_item_details :ta, name, color
      end

    end

  end
end