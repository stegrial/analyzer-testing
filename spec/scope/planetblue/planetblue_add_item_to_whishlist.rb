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

      step "User clicks Collection Item", 'ZAFARI PLAY DRESS | New', 'zafari-play-dress-exclusive?' do |name, link|
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

      # todo: replace by full path to this title like in the beggining
      # todo: start from clicking by a.header-logo
      step "User goes to the Product Details page",
           settings('planetblue')['page'] + '/products/zafari-play-dress-exclusive?variant=31980430590036' do |url|
        page.visit url
      end

      step "User clicks Whishlist button" do
        page.execute_script "window.scrollBy(0,500)"
        modal.click_close_policies_button :il
        product_details.find_product_title :il, 'ZAFARI PLAY DRESS | New'
        product_details.click_whishlist_button :il
      end

      step "User selects from Menu", 'Whishlist' do |value|
        menu.click_menu_button :il
        menu.click_menu_item :il, value
      end

      step "User checks link input field" do
        # input.giftreggie-permalink.form-control
      end

      step "User checks Copy Link button" do
        #
      end

      step "User checks Product Card" do
        # #product-card-2764098
      end

      step "User clicks Remove Card button" do
        # .wishlist__remove-button\
      end

      step "User clicks Back link" do
        # .wishlist__back-button
      end

    end
    
    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end


    end

  end
  
end