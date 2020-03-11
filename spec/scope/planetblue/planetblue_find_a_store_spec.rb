require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

find_a_store = FindAStore.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'Planet Blue - Find a Store' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        menu.click_menu_button
      end

      step "User clicks on Menu Item", 'Find a store' do |value|
        menu.click_menu_item value
      end

      step "User checks page Header", 'Find A Store' do |title|
        find_a_store.find_page_header :il, title
      end

      step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
        find_a_store.find_store_item_details :il, title
      end

      step "User checks Store item", 'Planet Blue | Dallas' do |title|
        find_a_store.find_store_item_details :il, title
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :xpath, PlanetBlue::MENU_BUTTON_TA, PlanetBlue::MENU_BUTTON_IL
        menu.click_menu_button :ta
      end

      step "User clicks on Menu Item", 'Find a store' do |value|
        check_element_path :xpath, menu.menu_item(:ta, value),
                           menu.menu_item(:il, value)
        menu.click_menu_item :ta, value
      end

      step "User checks page Header", 'Find A Store' do |title|
        check_element_path :xpath, find_a_store.find_page_header(:ta, title),
                           find_a_store.find_page_header(:il, title)
        find_a_store.find_page_header :ta, title
      end

      step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
        check_element_path :xpath, find_a_store.find_store_item_details(:ta, title),
                           find_a_store.find_store_item_details(:il, title)
        find_a_store.find_store_item_details :ta, title
      end

      step "User checks Store item", 'Planet Blue | Dallas' do |title|
        check_element_path :xpath, find_a_store.find_store_item_details(:ta, title),
                           find_a_store.find_store_item_details(:il, title)
        find_a_store.find_store_item_details :ta, title
      end

    end

  end
end