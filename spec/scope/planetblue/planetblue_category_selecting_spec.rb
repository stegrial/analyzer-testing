require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/planetblue'

include ElementSearchValidation

planetblue = PlanetBlue.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'Planet Blue - Category Selecting' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        planetblue.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        planetblue.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        planetblue.click_menu_category value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        planetblue.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        planetblue.find_category_dropdown value1
        planetblue.find_category_dropdown value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|
        planetblue.find_collection_item_parts name, color
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :css, PlanetBlue::MAIN_MENU_BUTTON_TA, PlanetBlue::MAIN_MENU_BUTTON_IL
        planetblue.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        check_element_path :xpath, planetblue.menu_category(:ta, value), planetblue.menu_category(:il, value)
        planetblue.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        check_element_path :xpath, planetblue.menu_category(:ta, value), planetblue.menu_category(:il, value)
        planetblue.click_menu_category value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        check_element_path :xpath, planetblue.menu_category(:ta, value), planetblue.menu_category(:il, value)
        planetblue.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        check_element_path :xpath, planetblue.category_dropdown(:ta, value1), planetblue.category_dropdown(:il, value1)
        check_element_path :xpath, planetblue.category_dropdown(:ta, value2), planetblue.category_dropdown(:il, value2)
        planetblue.find_category_dropdown value1
        planetblue.find_category_dropdown value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|
        check_element_path(:xpath, planetblue.collection_item_link(:ta, name), planetblue.collection_item_link(:il, name))
        check_element_path(:xpath, planetblue.collection_item_title(:ta, name), planetblue.collection_item_title(:li, name))
        check_element_path(:xpath, planetblue.collection_item_image(:ta, name), planetblue.collection_item_image(:li, name))
        check_element_path(:xpath, planetblue.collection_item_price(:ta, name), planetblue.collection_item_price(:li, name))
        check_element_path(:xpath, planetblue.collection_item_color(:ta, name, color), planetblue.collection_item_color(:li, name, color))
        planetblue.find_collection_item_parts name, color
      end

    end

  end
end