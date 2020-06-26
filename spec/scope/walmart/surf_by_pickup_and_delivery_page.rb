require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

include ElementSearchValidation

delivery_page = PickupAndDeliveryPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Pickup And Delivery page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['delivery_page'] do |url|
          page.visit url
        end

        step "User clicks close button for close modal" do
          delivery_page.click_close_btn
        end

        step "User clicks Explore the Site link" do
          delivery_page.click_explore_the_site
        end

        step "User sees Nearby stores" do
          delivery_page.should_see_find_nearby_stores
        end

        step "User clicks change stories" do
          delivery_page.click_change_stores
        end

        step "User sees Locations H2" do
          delivery_page.should_see_locations_h2
        end

        step "User clicks close Locations" do
          delivery_page.click_close_locations
        end

        step "User sees reserve time slot" do
          delivery_page.should_see_reserve_time_slot
        end

        step "User sees See Times button" do
          delivery_page.should_see_see_times_btn
        end

        step "User sees Cart Header text" do
          delivery_page.should_see_cart_header
        end

        step "User sees 'Your cart is currently empty.' text" do
          delivery_page.should_see_cart_is_empty_text
        end

        step "User sees 'Add items from your favorites' button" do
          delivery_page.should_see_add_items_btn
        end

        step "User sees 'Subtotal' text" do
          delivery_page.should_see_subtotal_text
        end

        step "User sees 'Check out' button" do
          delivery_page.should_see_checkout_btn
        end
      end
    end
  end
end