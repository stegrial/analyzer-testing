require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
find_a_store = FindAStore.new
menu = Menu.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Find a Store' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

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
          planetblue.find_page_header title
        end

        step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
          find_a_store.find_store_item_details title
        end

        step "User checks Store item", 'Planet Blue | Dallas' do |title|
          find_a_store.find_store_item_details title
        end

      end
    end
  end
end