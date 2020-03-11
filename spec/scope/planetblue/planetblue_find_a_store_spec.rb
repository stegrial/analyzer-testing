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


  feature 'Planet Blue - Find a Store' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        planetblue.click_menu_button
      end

      step "User clicks on Menu Item", 'Find a store' do |value|
        planetblue.click_menu_item value
      end

      step "User checks page Header", 'Find A Store' do |title|
        planetblue.find_page_header :il, title
      end

      step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
        planetblue.find_store_item_details :il, title
      end

      step "User checks Store item", 'Planet Blue | Dallas' do |title|
        planetblue.find_store_item_details :il, title
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        check_element_path :xpath, planetblue.MENU_BUTTON_TA, planetblue.MENU_BUTTON_IL
        planetblue.click_menu_button :ta
      end

      step "User clicks on Menu Item", 'Find a store' do |value|
        check_element_path :xpath, planetblue.menu_item(:ta, value),
                           planetblue.menu_item(:il, value)
        planetblue.click_menu_item :ta, value
      end

      step "User checks page Header", 'Find A Store' do |title|
        check_element_path :xpath, planetblue.find_page_header(:ta, title),
                           planetblue.find_page_header(:il, title)
        planetblue.find_page_header :ta, title
      end

      step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
        check_element_path :xpath, planetblue.find_store_item_details(:ta, title),
                           planetblue.find_store_item_details(:il, title)
        planetblue.find_store_item_details :ta, title
      end

      step "User checks Store item", 'Planet Blue | Dallas' do |title|
        check_element_path :xpath, planetblue.find_store_item_details(:ta, title),
                           planetblue.find_store_item_details(:il, title)
        planetblue.find_store_item_details :ta, title
      end

    end

  end
end