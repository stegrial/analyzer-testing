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
    
    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User logs in",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|
        menu.click_user_button :ta
        page.execute_script "window.scrollBy(0,400)"

        check_element_path :css, login.EMAIL_FIELD_TA, login.EMAIL_FIELD_IL
        check_element_path :css, login.PASSWORD_FIELD_TA, login.PASSWORD_FIELD_IL
        check_element_path :css, login.SIGN_IN_BUTTON_TA, login.SIGN_IN_BUTTON_IL

        login.fill_email_field :ta, email
        login.fill_password_field :ta, password
        login.click_sign_in_button :ta
      end

      step "User goes to the page", settings('planetblue')['page'] + 'collections/boho-dresses' do |url|
        page.visit url
      end

      step "User clicks Collection Item" do
        check_element_path :xpath, planetblue.collection_item_by_num( :ta, 1),
                           planetblue.collection_item_by_num( :il, 1)
        planetblue.click_collection_item_by_num :ta, 1
      end

      step "User clicks Whishlist button" do
        page.execute_script "window.scrollBy(0,500)"
        modal.click_close_discount_button :ta
        check_element_path :css, planetblue.WHISHLIST_BUTTON_TA, planetblue.WHISHLIST_BUTTON_IL
        product_details.click_whishlist_button :ta
      end

      step "User checks input field with link" do
        check_element_path :css, planetblue.WHISHLIST_BUTTON_TA, planetblue.WHISHLIST_BUTTON_IL
        wishlist.find_input_field_with_link :ta
      end

      step "User checks Copy Link button" do
        check_element_path :css, planetblue.COPY_LINK_BUTTON_TA, planetblue.COPY_LINK_BUTTON_IL
        wishlist.find_copy_link_button :ta
      end

      step "User checks Product Card" do
        check_element_path :xpath, wishlist.product_card(:ta, number), wishlist.product_card(:il, 1)
        wishlist.find_product_card :ta, 1
      end

      step "User clicks Remove Card button" do
        check_element_path :xpath, wishlist.whishlist_remove_button(:ta, 1),
                           wishlist.whishlist_remove_button(:il, 1)
        wishlist.click_whishlist_remove_button :ta, 1
      end

      step "User clicks Back link" do
        check_element_path :xpath, wishlist.WISHLIST_BACK_BUTTON_TA, wishlist.WISHLIST_BACK_BUTTON_IL
        wishlist.click_whishlist_back_button :ta
      end
    end

  end
  
end