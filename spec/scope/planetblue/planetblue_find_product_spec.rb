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


  feature 'Planet Blue - Find Product' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Search Button" do
        menu.click_search_button
      end

      step "User fills Search Field", 'RUTH TUNIC | New' do |value|
        menu.fill_search_field value
      end

      step "User clicks Search Suggestions item", 'ruth tunic new' do |value|
        menu.click_search_item value
      end

      step "User checks found items", 'RUTH TUNIC | New' do |value|
        planetblue.total_items 2
        planetblue.find_collection_item value, 'ruth-tunic?'
        planetblue.find_collection_item value, 'ruth-tunic-1?'
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Search Button" do
        check_element_path(:xpath, menu.click_search_button(:ta),
                           menu.click_search_button(:il))
        menu.click_search_button
      end

      step "User fills Search Field", 'RUTH TUNIC | New' do |value|
        check_element_path(:xpath, menu.fill_search_field(:ta, value),
                           menu.fill_search_field(:il, value))
        menu.fill_search_field value
      end

      step "User clicks Search Suggestions item", 'ruth tunic new' do |value|
        check_element_path(:xpath, menu.click_search_item(:ta, value),
                           menu.click_search_item(:il, value))
        menu.click_search_item :ta, value
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