require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

planetblue = PlanetBlue.new
product_details = ProductDetails.new
menu = Menu.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'Planet Blue - Find Product Details' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Clothing' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Clothing' do |title|
        planetblue.find_page_header :il, title
      end

      step "User clicks Collection Item", 'THE JESSIE MIDI', 'the-jessie-midi-2?' do |name, link|
        planetblue.click_collection_item name, link: link
      end

      step "User checks Breadcrumbs", 'Home', 'THE JESSIE MIDI' do |breadcrumb1, breadcrumb2|
        product_details.find_breadcrumb breadcrumb1, with_link: true
        product_details.find_breadcrumb breadcrumb2, with_link: false
      end

      step "User checks product image", 'THE JESSIE MIDI' do |name|
        product_details.find_product_image name
      end

      # TODO check title
      # TODO check radiobuttons by numbers
      # TODO check like button
      # TODO check designer
      # TODO check id
      # TODO check price
      # TODO check payment details
      # TODO check Learn more link in payment details
      # TODO check Review Stars
      # TODO check Reviews Number
      # TODO check Select Color Text
      # TODO check Select Color Image
      # TODO check Size Guide
      # TODO check Size Text
      # TODO check Sizes Items
      # TODO check 'Add to bag' button
      # TODO check Share buttons
      # TODO check details and review links
      # TODO check details text
      # TODO check items in section: You may also like
      # TODO check items in section: complete the look

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Search Button" do
        check_element_path(:xpath, product_details.click_search_button(:ta),
                           product_details.click_search_button(:il))
        product_details.click_search_button
      end

      # TODO complete

    end

  end
end