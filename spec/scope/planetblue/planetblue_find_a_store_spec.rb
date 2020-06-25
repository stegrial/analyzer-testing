require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
find_a_store = FindAStore.new
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

  feature 'Planet Blue - Find a Store' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
          modal.click_close_continue_shop_button
        end

        step "User clicks Navigation Bar Link", 'Stores' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", 'Find A Store' do |title|
          planetblue.should_see_page_header title
        end

        step "User checks Store item", 'Planet Blue | Newport Beach' do |title|
          find_a_store.should_see_store_item_details title
        end

        step "User checks Store item", 'Planet Blue | Dallas' do |title|
          find_a_store.should_see_store_item_details title
        end

        sleep 3
      end
    end

  end
end
