require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Sort Products' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks Navigation Bar Link", 'Best of Boho' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", 'Best of Boho' do |title|
          planetblue.find_page_header title
        end

        step "User checks Collection Items" do
          planetblue.find_collection_item_by_num 1
        end

        step "User selects Category Dropdown value", 'Oldest first' do |value|
          modal.click_close_discount_button
          planetblue.select_from_sort_dropdown value
        end

        step "User checks Collection Items", 'SEINE DOUBLE COIN', 'seine-double-coin?' do |name, link|
          planetblue.find_collection_item name, link
        end

      end
    end
  end
end