require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
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

  feature 'Planet Blue - Find Product' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

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
end