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

      # todo
      step "User checks product title", 'THE JESSIE MIDI' do |name|
        product_details.find_product_title name
      end

      step "User checks product radiobuttons", number do |name|
        (1..5).each { |num|
          product_details.find_product_radiobutton name, num
        }
      end

      step "User checks product 'Like' Button" do
        product_details.find_wishlist_button
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

      step "User checks product review stars",5 do |number|
        (1..number).each { |num|
          product_details.find_review_stars num
        }
      end

      step "User checks product payment details" do
        product_details.find_reviews_number
      end

      step "User checks product sizes guide link" do
        product_details.find_sizes_guide_link
      end

      step "User checks product sizes items", [ '', '', '' ] do |sizes|
        product_details.find_size_item sizes
      end

      step "User checks 'Add to bag' button" do
        product_details.find_add_to_bag_button
      end

      step "User checks Social Share buttons", [ '', '', '' ] do |social_sharing_buttons|
        social_sharing_buttons.each { |button|
          product_details.find_social_share_button button
        }
      end

      step "User checks product details and review tabs" do
        product_details.product_section_tab 'Details'
        product_details.product_section_tab 'Review'
      end

      step "User checks product details text", '...' do |text|
        product_details.find_product_content text
      end

      step "User checks section 'You may also like'", 'THE JESSIE MIDI', 'BAYLEE DRESS' do |name1, name2|
        product_details.find_also_like_item name1
        product_details.find_also_like_item name2
      end

      step "User checks section 'Complete the look'"  do
        product_details.find_complete_the_look_item 'BELL JUMPER', '$134.00'
        product_details.find_complete_the_look_item 'BELL JUMPER', '$143.00'
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