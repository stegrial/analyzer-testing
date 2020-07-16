require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"

navigation = VenusNavigation.new
sub_category = VenusSubCategory.new
product_page = VenusProduct.new
describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Search Item' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('venus')['home_page'] do |url|
          page.visit url
        end

        step "User clicks on the Search button" do
          navigation.click_search_button
        end

        step "User enters value to search", 'mesh ruched midi dress' do |value|
          navigation.enter_search_value value
        end

        step "User clicks Find button" do
          navigation.click_find_button
        end

        step "User clicks View Detail for second item in the list" do
          sub_category.click_view_detail_second
        end

        step "User checks price on product", "..." do |price|
          product_page.should_see_price_on_product price
        end

        step "User checks image on product", '1' do |image_num|
          product_page.should_see_main_image_on_product image_num
        end

      end
    end
  end
end