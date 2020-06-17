require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
designers = Designers.new
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

  feature 'Planet Blue - Find a Product by Designers' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks Navigation Bar Link", 'Designers' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", 'Designers' do |title|
          modal.click_close_policies_button
          planetblue.should_see_page_header title
        end

        step "User checks Designers List Item", '#', 'Y' do |value1, value2|
          designers.should_see_designers_list_section value1
          designers.should_see_designers_list_section value2
        end

        step "User clicks Designer Item", '27 MILES MALIBU' do |value|
          scroll_to_element -500
          designers.click_designers_list_item value
        end

        step "User checks Collection Item",
             'ESSIE CREWNECK SWEATER | New', 'essie-crewneck-sweater?' do |name, link|
          planetblue.should_see_collection_item name, link
        end

        sleep 3
      end
    end

  end
end
