require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
menu = Menu.new
product_details = ProductDetails.new
login = Login.new
modal = Modal.new
wishlist = Whishlist.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Add item to whishlist' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User logs in",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|
        menu.click_user_button
        page.execute_script "window.scrollBy(0,400)"
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
        page.execute_script "window.scrollBy(0,500)"
        modal.click_close_discount_button
        product_details.click_whishlist_button
      end

      step "Navigate to Whishlist" do
        page.visit settings('planetblue')['page'] + 'apps/giftregistry/wishlist/'
      end

      step "User checks input field with link" do
        wishlist.find_input_field_with_link
      end

      step "User checks Copy Link button" do
        wishlist.find_copy_link_button
      end

      step "User checks Product Card" do
        wishlist.find_product_card 1
      end

      step "User clicks Remove Card button" do
        wishlist.click_whishlist_remove_button 1
      end

      step "User clicks Back link" do
        wishlist.click_whishlist_back_button
      end

    end
  end
end