require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
designers = Designers.new
modal = Modal.new
login = Login.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Find a Product by Designers' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
          modal.click_close_continue_shop_button
        end

        step "User clicks Navigation Bar Link", 'Designers' do |value|
          planetblue.click_navbar_link value
          sleep 4 # wait for page load
        end

        step "User checks page Header", 'Designers' do |title|
          planetblue.should_see_page_header title
          login.click_sign_up_close_button
          modal.click_close_policies_button
        end

        step "User checks Designers List Item", 'HAT ATTACK', 'NATION LTD' do |value1, value2|
          designers.should_see_designers_list_section value1
          designers.should_see_designers_list_section value2
        end

        step "User clicks Designer Item", '27 MILES MALIBU' do |value|
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
