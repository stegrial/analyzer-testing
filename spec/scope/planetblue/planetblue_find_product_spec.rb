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
  end
end