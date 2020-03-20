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


  feature 'Planet Blue - Filter Products' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'LOUNGEwear' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Loungewear' do |title|
        planetblue.find_page_header title
      end

      step "User checks Collection Items", 'CAMO PULLOVER | New', 'camo-pullover?' do |name, link|
        planetblue.find_collection_item name, link
      end

      step "User selects Refine Category Dropdown values", 'Category',
           [ 'Rompers + Jumpsuits', 'Shorts' ]  do |section, values|
        planetblue.select_from_refine_dropdown section, values
      end

      step "User checks Collection Items"  do
        planetblue.find_collection_item 'BRITTON JUMPSUIT', 'britton-jumpsuit?'
        planetblue.find_collection_item 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?'
      end

    end

  end
end