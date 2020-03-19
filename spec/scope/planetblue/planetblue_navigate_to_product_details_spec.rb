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


  feature 'Planet Blue - Find Product Details' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Clothing' do |value|
        planetblue.click_navbar_link value
      end

      step "User checks page Header", 'Clothing' do |title|
        planetblue.find_page_header title
      end

      step "User clicks Collection Item", 'THE JESSIE MIDI', 'the-jessie-midi-2?' do |name, link|
        planetblue.click_collection_item name, link
      end

      step "User checks Breadcrumbs", 'Home', 'THE JESSIE MIDI' do |breadcrumb1, breadcrumb2|
        planetblue.find_breadcrumb breadcrumb1, true
        planetblue.find_breadcrumb breadcrumb2, false
      end

      step "User checks product image", 'THE JESSIE MIDI' do |name|
        product_details.find_product_scale_image name
        product_details.find_product_image name
      end

      step "User checks product title", 'THE JESSIE MIDI' do |name|
        product_details.find_product_title name
      end

      step "User checks product radiobuttons", 'THE JESSIE MIDI', 5 do |name, number|
        (1..number).each { |num|
          product_details.find_product_radiobutton name, num
        }
      end

      step "User checks product designer" do
        product_details.find_product_designer
      end

      step "User checks product ID" do
        product_details.find_product_id
      end

      step "User checks product price" do
        product_details.find_product_price
      end

      step "User checks product payment details" do
        product_details.find_payment_details
      end

      step "User checks 'Learn more' link" do
        product_details.find_learn_more_link
      end

      step "User checks product payment details" do
        product_details.find_reviews_number
      end

      step "User checks product sizes guide link" do
        product_details.find_sizes_guide_link
      end

      step "User checks product sizes items", %w(XS S M L) do |sizes|
        sizes.each { |size|
          product_details.find_size_item size
        }
      end

      step "User checks 'Add to bag' button" do
        product_details.find_add_to_bag_button
      end

      step "User checks Social Share buttons", %w(facebook twitter pinterest) do |social_sharing_buttons|
        social_sharing_buttons.each { |button|
          product_details.find_social_share_button button
        }
      end

      step "User checks section 'You may also like'" do
        product_details.find_bottom_section_item 'You May Also Like', 'THE JESSIE MIDI', '$219.00'
        product_details.find_bottom_section_item 'You May Also Like', 'BAYLEE DRESS', '$198.00'
      end

      step "User checks section 'Complete the look'"  do
        product_details.find_bottom_section_item 'Complete the Look', 'BELL JUMPER', '$134.00'
        product_details.find_bottom_section_item 'Complete the Look', 'BELL JUMPER', '$143.00'
      end

    end


    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end


      # TODO complete

    end

  end
end