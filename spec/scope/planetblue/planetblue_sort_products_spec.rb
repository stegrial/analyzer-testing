require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
modal = Modal.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Sort Products' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Best of Boho' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Best of Boho' do |title|
        planetblue.find_page_header title
      end

      step "User checks Collection Items" do
        planetblue.find_collection_item_by_num 1
      end

      step "User selects Category Dropdown value", 'Oldest first'  do |value|
        modal.click_close_discount_button_if_exists
        planetblue.select_from_sort_dropdown value
      end

      step "User checks Collection Items", 'SEINE DOUBLE COIN', 'seine-double-coin?' do |name, link|
        planetblue.find_collection_item name, link
      end

    end

    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Best of Boho' do |value|
        check_element_path :xpath, planetblue.navbar_link(:ta, value), planetblue.navbar_link(:il, value)
        planetblue.click_navbar_link :ta, value
      end

      step "User checks page Header", 'Best of Boho' do |title|
        check_element_path :xpath, planetblue.page_header(:ta, title), planetblue.page_header(:il, title)
        planetblue.find_page_header :ta, title
      end

      step "User checks Collection Items",
           'ZAFARI PLAY DRESS | New', 'zafari-play-dress-exclusive?' do |name, link|
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, name, link),
                           planetblue.collection_item_by_link(:il, name, link)
        planetblue.find_collection_item :ta, name, link
      end

      step "User selects Category Dropdown value",
           'Sort', 'Oldest first'  do |dropdown, value|
        check_element_path :xpath, planetblue.category_dropdown(:ta, dropdown),
                           planetblue.category_dropdown(:il, dropdown)
        planetblue.select_from_sort_dropdown :ta, value
      end

      step "User checks Collection Items",
           'SEINE DOUBLE COIN', 'seine-double-coin?' do |name, link|
        check_element_path :xpath, planetblue.collection_item_by_link(:ta, name, link),
                           planetblue.collection_item_by_link(:il, name, link)
        planetblue.find_collection_item :ta, name, link
      end

    end

  end
end