require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/planetblue'

include ElementSearchValidation

it = PlanetBlue.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Planet Blue - category selecting' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        it.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        it.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        it.click_menu_category value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        it.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        it.find_category_dropdown value1
        it.find_category_dropdown value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|
        it.check_collection_item name, color
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :css, PlanetBlue::MAIN_MENU_BUTTON_TA, PlanetBlue::MAIN_MENU_BUTTON_IL
        it.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        check_element_path :xpath, it.menu_category(:ta, value), it.menu_category(:il, value)
        it.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        check_element_path :xpath, it.menu_category(:ta, value), it.menu_category(:il, value)
        it.click_menu_category value
      end

      step "User clicks on Menu Category", 'Basics' do |value|
        check_element_path :xpath, it.menu_category(:ta, value), it.menu_category(:il, value)
        it.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        check_element_path :xpath, it.category_dropdown(:ta, value1), it.category_dropdown(:il, value1)
        check_element_path :xpath, it.category_dropdown(:ta, value2), it.category_dropdown(:il, value2)
        it.find_category_dropdown value1
        it.find_category_dropdown value2
      end

      step "User checks Collection Items", 'RUTH TUNIC | New', 'Bright Rose' do |name, color|

        check_element_path(:xpath, it.collection_item_link(:il, name), it.collection_item_link(:ta, name))
        check_element_path(:xpath, it.collection_item_title(:il, name), it.collection_item_title(:ta, name))
        check_element_path(:xpath, it.collection_item_image(:il, name), it.collection_item_image(:ta, name))
        check_element_path(:xpath, it.collection_item_price(:il, name), it.collection_item_price(:ta, name))
        check_element_path(:xpath, it.collection_item_color(:il, name, color), it.collection_item_color(:ta, name, color))

        it.check_collection_item name, color
      end

    end

  end
end