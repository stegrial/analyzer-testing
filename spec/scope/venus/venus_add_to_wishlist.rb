require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"


product_page = VenusProduct.new
wishlist = VenusWishList.new
login_page = VenusLogin.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Add items to Wishlist' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page",
             settings('venus')['view_product_page'] + '?BRANCH=7~2999~&ProductDisplayID=40314' do |url|
          page.visit url
        end

        step "User selects Size", '8' do |size|
          scroll_to_element 1000
          product_page.choose_list_size size
        end

        step "User opens dropdown to select the quantity of product" do
          product_page.open_qty_dropdown
        end

        step "User selects the quantity of product", 2 do |qty|
          product_page.select_quantity qty
        end

        step "User clicks 'Wishlist' button" do
          product_page.click_wish_list_button
        end

        step "User logs in" do
          login_page.fill_email_field email
          login_page.fill_pass_field pass
          login_page.click_sign_in_button
        end

        step "User checks Product Size" do
          wishlist.should_see_product_size
        end

        step "User clicks remove wishlist button" do
          wishlist.click_remove_wish_list
        end

      end
    end
  end
end