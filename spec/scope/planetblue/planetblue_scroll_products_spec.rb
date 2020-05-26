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


  feature 'Planet Blue - Scroll Products' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'New' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", "What's New" do |title|
        planetblue.find_page_header title
      end

      step "User checks Collection Items and scroll down" do
        page.execute_script "window.scrollBy(0,1000)"
        modal.click_close_discount_button
        planetblue.find_collection_item_by_num 1
      end

      step "User checks Collection Items" do
        planetblue.find_collection_item_by_num 7
      end

      step "User clicks 'Back to top' button" do
        planetblue.click_back_to_top_button
      end

      step "User scroll down to the bottom of the page" do
        (1..10).each {
          page.execute_script "window.scrollBy(0,10000)"
        }
      end

      step "User click 'Load More' button" do
        planetblue.click_load_more_button
      end

    end

    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'New' do |value|
        check_element_path :xpath, planetblue.navbar_link(:ta, value), planetblue.navbar_link(:il, value)
        planetblue.click_navbar_link :ta, value
      end

      step "User checks page Header", "What's New" do |title|
        check_element_path :xpath, planetblue.page_header(:ta, title), planetblue.page_header(:il, title)
        planetblue.find_page_header :ta, title
      end

      step "User checks Collection Items and scroll down" do
        modal.click_close_discount_button
        check_element_path :xpath, planetblue.collection_item_by_num(:ta, 1),
                           planetblue.collection_item_by_num(:il, 1)
        planetblue.find_collection_item_by_num :ta, 1
        page.execute_script "window.scrollBy(0,1000)"
      end

      step "User checks Collection Items" do
        check_element_path :xpath, planetblue.collection_item_by_num(:ta, 7),
                           planetblue.collection_item_by_num(:il, 7)
        planetblue.find_collection_item_by_num :ta, 7
      end

      step "User clicks 'Back to top' button" do
        check_element_path :css, planetblue.BACK_TO_TOP_BUTTON_TA, planetblue.BACK_TO_TOP_BUTTON_IL
        planetblue.click_back_to_top_button :ta
      end

      step "User scroll down to the bottom of the page" do
        page.execute_script "window.scrollBy(0,5000)"
        5000.each { |pixels|
          sleep 1
          page.execute_script "window.scrollBy(0,#{pixels})"
        }
      end

      step "User scroll down to the bottom of the page" do
        (1..10).each {
          page.execute_script "window.scrollBy(0,10000)"
        }
      end

      step "User click 'Load More' button" do
        check_element_path :css, planetblue.LOAD_MORE_BUTTON_TA, planetblue.LOAD_MORE_BUTTON_IL
        planetblue.click_load_more_button :ta
      end

    end

  end
end