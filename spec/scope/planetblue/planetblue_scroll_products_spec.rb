require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Scroll Products' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks Navigation Bar Link", 'New' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", "What's New" do |title|
          planetblue.should_see_page_header title
        end

        step "User checks Collection Items and scroll down" do
          scroll_to_element 1000
          #modal.click_close_discount_button  # if modal appears
          planetblue.should_see_collection_item_by_num 1
        end

        step "User checks Collection Items" do
          planetblue.should_see_collection_item_by_num 7
        end

        step "User clicks 'Back to top' button" do
          planetblue.click_back_to_top_button
        end

        step "User scroll down to the bottom of the page" do
          (1..15).each {
            scroll_to_element 10000
          }
          modal.click_close_policies_button
        end

        sleep 3
      end
    end

  end
end
