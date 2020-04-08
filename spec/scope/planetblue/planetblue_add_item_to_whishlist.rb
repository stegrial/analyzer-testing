require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
product_details = ProductDetails.new
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
        planetblue.click_content_card_button 'Dresses'
      end

      step "User clicks Collection Item", 'ZAFARI PLAY DRESS | New', 'zafari-play-dress-exclusive?' do |name, link|
        planetblue.click_collection_item name, link
      end

      step "User clicks Whishlist button" do
        product_details.click_whishlist_button
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Sign In' Button",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|

        page.execute_script "window.scrollBy(0,400)"

        login.fill_email_field :ta, email
        login.fill_password_field :ta, password
        login.click_sign_in_button :ta
      end

      step "User goes to the Product Details page",
           settings('planetblue')['page'] + '/products/zafari-play-dress-exclusive?variant=31980430590036' do |url|
        page.visit url
      end

      step "User clicks Whishlist button" do
        product_details.click_whishlist_button
      end

      step "User clicks on Menu Item", 'Whishlist' do |value|
        menu.click_menu_item :ta, value
      end

    end
    
    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end


    end

  end
  
end