require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
menu = Menu.new
modal = Modal.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Category Selecting' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        menu.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        menu.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        menu.click_menu_category value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        menu.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        planetblue.find_category_dropdown value1
        planetblue.find_category_dropdown value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|
        modal.click_close_discount_button
        planetblue.find_collection_item_details name, color
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

      step "User clicks on Menu Category", 'Clothing' do |value|
        check_element_path :css, menu.menu_category(:ta, value), menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        check_element_path :css, menu.menu_category(:ta, value), menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        check_element_path :css, menu.menu_category(:ta, value), menu.menu_category(:il, value)
        menu.click_menu_category :ta, value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        check_element_path :xpath, planetblue.category_dropdown(:ta, value1), planetblue.category_dropdown(:il, value1)
        check_element_path :xpath, planetblue.category_dropdown(:ta, value2), planetblue.category_dropdown(:il, value2)
        planetblue.find_category_dropdown :ta, value1
        planetblue.find_category_dropdown :ta, value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|

        check_element_path( :xpath, collection_item_link(:ta, name), collection_item_link(:il, name))
        check_element_path( :xpath, collection_item_title(:ta, name), collection_item_title(:il, name))
        check_element_path( :xpath, collection_item_image(:ta, name), collection_item_image(:il, name))
        check_element_path( :xpath, collection_item_color(:ta, name, color), collection_item_color(:il, name, color))
        
        planetblue.find_collection_item_details :ta, name, color
      end

    end

  end
  
end