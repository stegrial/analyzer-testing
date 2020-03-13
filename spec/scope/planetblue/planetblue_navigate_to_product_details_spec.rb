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

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'Planet Blue - Find Product Details' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Navigation Bar Link", 'Clothing' do |value|
        planetblue.click_navbar_link :il, value
      end

      step "User checks page Header", 'Clothing' do |title|
        planetblue.find_page_header :il, title
      end

      step "User clicks Collection Item", 'THE JESSIE MIDI', 'the-jessie-midi-2?' do |name, link|
        planetblue.click_collection_item :il, name, link
      end

      step "User checks Breadcrumbs", 'Home', 'THE JESSIE MIDI' do |breadcrumb1, breadcrumb2|
        planetblue.find_breadcrumb :il, breadcrumb1, true
        planetblue.find_breadcrumb :il, breadcrumb2, false
      end

      step "User checks product image", 'THE JESSIE MIDI' do |name|
        product_details.find_product_scale_image :il, name
        product_details.find_product_image :il, name
      end

      step "User checks product title", 'THE JESSIE MIDI' do |name|
        product_details.find_product_title :il, name
      end

      step "User checks product radiobuttons", 'THE JESSIE MIDI', 5 do |name, number|
        (1..number).each { |num|
          product_details.find_product_radiobutton :il, name, num
        }
      end

      step "User checks product designer" do
        product_details.find_product_designer :il
      end

      step "User checks product ID" do
        product_details.find_product_id :il
      end

      step "User checks product price" do
        product_details.find_product_price :il
      end

      step "User checks product payment details" do
        product_details.find_payment_details :il
      end

      step "User checks 'Learn more' link" do
        product_details.find_learn_more_link :il
      end

      step "User checks product review stars",5 do |number|
        (1..number).each { |num|
          product_details.find_review_stars :il, num
        }
      end

      step "User checks product payment details" do
        product_details.find_reviews_number :il
      end

      step "User checks product sizes guide link" do
        product_details.find_sizes_guide_link :il
      end

      step "User checks product sizes items", %w(XS S M L) do |sizes|
        sizes.each { |size|
          product_details.find_size_item :il, size
        }
      end

      step "User checks 'Add to bag' button" do
        product_details.find_add_to_bag_button :il
      end

      step "User checks Social Share buttons", %w(facebook twitter pinterest) do |social_sharing_buttons|
        social_sharing_buttons.each { |button|
          product_details.find_social_share_button :il, button
        }
      end

      step "User checks product details and review tabs" do
        product_details.find_product_details_tab :il, 'Details'
        product_details.find_product_details_tab :il, 'Review'
      end

      step "User checks product details content" do
        product_details.find_product_details_content :il
      end

      step "User checks section 'You may also like'" do
        product_details.find_bottom_section_item :il, 'You May Also Like', 'THE JESSIE MIDI', '$219.00'
        product_details.find_bottom_section_item :il, 'You May Also Like', 'BAYLEE DRESS', '$198.00'
      end

      step "User checks section 'Complete the look'"  do
        product_details.find_bottom_section_item :il, 'Complete the Look', 'BELL JUMPER', '$134.00'
        product_details.find_bottom_section_item :il, 'Complete the Look', 'BELL JUMPER', '$143.00'
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