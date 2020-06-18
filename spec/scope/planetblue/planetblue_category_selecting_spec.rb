require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
menu = Menu.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Category Selecting' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks on Menu button" do
          menu.click_menu_button
        end

        step "User clicks on Menu Category", 'Clothing' do |value|
          menu.click_menu_category value
        end

        step "User clicks on Menu Category", 'Tops' do |value|
          menu.click_menu_category value
        end

        step "User clicks on Menu Category", 'Basics' do |value|
          menu.click_menu_category value
        end

        step "User checks Collection Items", 'RUTH TUNIC | New' do |name|
          modal.click_close_discount_button
          scroll_to_element 200
          planetblue.find_collection_item_details name
        end

        sleep 3
      end
    end

  end
end
