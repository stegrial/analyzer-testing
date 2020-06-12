require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
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

  feature 'Planet Blue - Filter Products' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks Navigation Bar Link", 'LOUNGEwear' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", 'Loungewear' do |title|
          planetblue.should_see_page_header title
        end

        step "User checks Collection Items", 'CAMO PULLOVER | New', 'camo-pullover?' do |name, link|
          modal.click_close_discount_button
          planetblue.should_see_collection_item name, link
        end

        step "User selects Refine Category Dropdown values", 'Category',
             ['Rompers + Jumpsuits', 'Shorts'] do |section, values|
          scroll_to_element 300
          planetblue.select_from_refine_dropdown section, values
        end

        step "User checks Collection Items" do
          planetblue.should_see_collection_item 'BRITTON JUMPSUIT', 'britton-jumpsuit?'
          planetblue.should_see_collection_item 'BIKER SHORT WITH TRIM | Sale', 'biker-short-with-trim?'
        end

        sleep 3
      end
    end

  end
end
