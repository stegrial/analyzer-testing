require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
product_details = ProductDetails.new
login = Login.new
order_details = OrderDetails.new
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

      step "User clicks content card button" do
        page.execute_script "window.scrollBy(0,500)"
        planetblue.click_content_card_button 'Dresses'
      end

      step "User clicks Collection Item", 'LOVERS WISH DRESS | New', 'lovers-wish-dress?' do |name, link|
        planetblue.click_collection_item :il, name, link
      end

      step "User clicks Whishlist button" do
        page.execute_script "window.scrollBy(0,500)"
        product_details.click_whishlist_button :il
      end

      step "User clicks Log In link" do
        product_details.click_alert_dialog_login_link :il
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Sign In' Button",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|

        page.execute_script "window.scrollBy(0,1000)"

        login.fill_email_field :il, email
        login.fill_password_field :il, password
        login.click_sign_in_button :il
        order_details.find_order_header :il
      end

      step "User goes to the Product Details page" do
        planetblue.click_header_logo :il
        planetblue.click_content_card_button :il, 'Dresses'
        planetblue.click_collection_item :il, 'LOVERS WISH DRESS | New', 'lovers-wish-dress?'
      end

      # todo: move through the main menu
      step "User clicks Whishlist button" do
        page.execute_script "window.scrollBy(0,500)"
        modal.click_close_policies_button :il
        product_details.find_product_title :il, 'LOVERS WISH DRESS | New'
        product_details.click_whishlist_button :il
      end

      step "User selects from Menu", 'Whishlist' do |value|
        menu.click_menu_button :il
        menu.click_menu_item :il, value
      end

      step "User checks input field with link" do
        wishlist.find_input_field_with_link :il
      end

      step "User checks Copy Link button" do
        wishlist.find_copy_link_button :il
      end

      step "User checks Product Card", 2764098 do |card_id|
        wishlist.find_product_card :il, card_id
      end

      step "User clicks Remove Card button" do
        wishlist.click_whishlist_remove_button :il
      end

      step "User clicks Back link" do
        wishlist.click_whishlist_back_button :il
      end

    end
    
    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end


    end

  end
  
end