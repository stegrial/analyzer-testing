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
          modal.click_close_continue_shop_button
        end

        step "User fills Search Field", 'RUTH TUNIC | New' do |value|
          menu.fill_search_field value
        end

        step "User clicks Search Suggestions item", 'ruth tunic new' do |value|
          menu.click_search_item value
        end

        step "User checks found items", 'RUTH TUNIC | New' do |value|
          modal.click_close_policies_button

          planetblue.should_see_total_items 1
          planetblue.should_see_collection_item value, 'ruth-tunic?'
        end

        sleep 3
      end
    end

  end
end
