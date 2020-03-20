require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
designers = Designers.new
menu = Menu.new
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

      step "User checks Collection Items", 'ZAFARI PLAY DRESS | New', 'zafari-play-dress-exclusive?' do |name, link|
        planetblue.find_collection_item name, link
      end

      step "User selects Category Dropdown value", 'Sort', 'Oldest first'  do |dropdown, value|
        planetblue.select_from_sort_dropdown dropdown, value
      end

      step "User checks Collection Items", 'SEINE DOUBLE COIN', 'seine-double-coin?' do |name, link|
        planetblue.find_collection_item name, link
      end

    end

  end
end