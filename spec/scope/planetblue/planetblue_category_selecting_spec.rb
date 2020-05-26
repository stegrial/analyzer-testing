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
  end
end