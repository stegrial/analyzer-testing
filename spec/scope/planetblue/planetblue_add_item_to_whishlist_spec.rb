require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

planetblue = PlanetBlue.new
menu = Menu.new
product_details = ProductDetails.new
login = Login.new
modal = Modal.new
wishlist = Whishlist.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Add item to whishlist' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
          modal.click_close_continue_shop_button
        end

        step "User clicks User header button" do
          modal.click_close_policies_button
          menu.click_user_header_button
        end

        step "User logs in",
             settings('planetblue')['email'],
             settings('planetblue')['pass'] do |email, password|

          login.click_sign_up_close_button

          login.fill_email_field email
          login.fill_password_field password
          login.click_sign_in_button
        end

        step "User goes to the page", settings('planetblue')['page'] + 'collections/boho-dresses' do |url|
          page.visit url
        end

        step "User clicks Collection Item" do
          planetblue.click_collection_item_by_num 1
        end

        step "User clicks Whishlist button" do
          sleep 7 # wait for wishlist button is loaded
          product_details.click_whishlist_button
        end

        step "Navigate to Whishlist" do
          page.visit settings('planetblue')['page'] + 'apps/giftregistry/wishlist/'
          sleep 5 # wait for page load
        end

        step "User checks input field with link" do
          wishlist.should_see_input_field_with_link
        end

        step "User checks Copy Link button" do
          wishlist.should_see_copy_link_button
        end

        step "User checks Product Card" do
          scroll_to_element 500
          wishlist.should_see_product_card 1
        end

        step "User clicks Remove Card button" do
          wishlist.click_whishlist_remove_button 1
        end

        step "User clicks Back link" do
          wishlist.click_whishlist_back_button
        end

        sleep 3
      end
    end

  end
end
