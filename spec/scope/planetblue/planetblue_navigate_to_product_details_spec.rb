require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
product_details = ProductDetails.new
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
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Designers' do |title|
        planetblue.find_page_header :il, title
      end

      step "User checks Designers List Item", '#', 'Z' do |value1, value2|
        planetblue.find_designer_list_item value1
        planetblue.find_designer_list_item value2
      end

      step "User clicks Designer Item Link", '24 MILES MALIBU' do |value|
        planetblue.click_designer_item_link value
      end

      step "User checks Collection Item", 'ESSIE CREWNECK SWEATER | New', 'Cloud' do |name, color|
        planetblue.find_collection_item_details name, color
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Search Button" do
        check_element_path(:xpath, planetblue.click_search_button(:ta),
                           planetblue.click_search_button(:il))
        planetblue.click_search_button
      end

      step "User fills Search Field", 'RUTH TUNIC | New' do |value|
        check_element_path(:xpath, planetblue.fill_search_field(:ta, value),
                           planetblue.fill_search_field(:il, value))
        planetblue.fill_search_field value
      end

      step "User clicks Search Suggestions item", 'ruth tunic new' do |value|
        check_element_path(:xpath, planetblue.click_search_item(:ta, value),
                           planetblue.click_search_item(:il, value))
        planetblue.click_search_item :ta, value
      end

      step "User checks found items",
           'RUTH TUNIC | New', 'ruth-runic?', 'ruth-runic-1?', 2 do |name, link1, link2, number|
        check_element_path(:xpath, planetblue.total_items(:ta, number),
                           planetblue.total_items(:il, number))
        check_element_path(:xpath, planetblue.collection_item_by_link(:ta, name, link1),
                           planetblue.collection_item_by_link(:il, name, link1))
        check_element_path(:xpath, planetblue.collection_item_by_link(:ta, name, link2),
                           planetblue.collection_item_by_link(:il, name, link2))
        planetblue.total_items :ta, number
        planetblue.find_collection_item :ta, name, link: link1
        planetblue.find_collection_item :ta, name, link: link2
      end

    end

  end
end