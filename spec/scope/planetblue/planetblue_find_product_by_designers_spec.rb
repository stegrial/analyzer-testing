require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

designers = Designers.new
menu = Menu.new
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
        designers.click_navbar_link value
      end

      step "User checks page Header", 'Designers' do |title|
        designers.find_page_header :il, title
      end

      step "User checks Designers List Item", '#', 'Y' do |value1, value2|
        designers.find_designers_list_section :il, value1
        designers.find_designers_list_section :il, value2
      end

      step "User clicks Designer Item", '27 MILES MALIBU' do |value|
        designers.click_designers_list_item value
      end

      step "User checks Collection Item",
           'ESSIE CREWNECK SWEATER | New', 'essie-crewneck-sweater?' do |name, link|
        designers.find_collection_item name, link: link
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
        check_element_path(:xpath, menu.total_items(:ta, number),
                           menu.total_items(:il, number))
        check_element_path(:xpath, menu.collection_item_by_link(:ta, name, link1),
                           menu.collection_item_by_link(:il, name, link1))
        check_element_path(:xpath, menu.collection_item_by_link(:ta, name, link2),
                           menu.collection_item_by_link(:il, name, link2))
        menu.total_items :ta, number
        designers.find_collection_item :ta, name, link: link1
        designers.find_collection_item :ta, name, link: link2
      end

    end

  end
end