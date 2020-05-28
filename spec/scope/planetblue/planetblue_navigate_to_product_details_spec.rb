require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"


planetblue = PlanetBlue.new
product_details = ProductDetails.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Find Product Details' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page", settings('planetblue')['page'] do |url|
          page.visit url
        end

        step "User clicks Navigation Bar Link", 'Clothing' do |value|
          planetblue.click_navbar_link value
        end

        step "User checks page Header", 'Clothing' do |title|
          planetblue.should_see_page_header title
        end

        step "User clicks Collection Item", 'THE JESSIE MIDI', 'the-jessie-midi-2?' do |name, link|
          planetblue.click_collection_item name, link
        end

        step "User checks Breadcrumbs", 'Home', 'THE JESSIE MIDI' do |breadcrumb1, breadcrumb2|
          modal.click_close_discount_button
          planetblue.should_see_breadcrumb breadcrumb1, true
          planetblue.should_see_breadcrumb breadcrumb2, false
        end

        step "User checks product image", 'THE JESSIE MIDI' do |name|
          product_details.should_see_product_scale_image name
          product_details.should_see_product_image name
        end

        step "User checks product title", 'THE JESSIE MIDI' do |name|
          product_details.should_see_product_title name
        end

        step "User checks product radiobuttons", 'THE JESSIE MIDI', 5 do |name, number|
          (1..number).each { |num|
            product_details.should_see_product_radiobutton name, num
          }
        end

        step "User checks product designer" do
          product_details.should_see_product_designer
        end

        step "User checks product ID" do
          product_details.should_see_product_id
        end

        step "User checks product price" do
          product_details.should_see_product_price
        end

        step "User checks product payment details" do
          product_details.should_see_payment_details
        end

        step "User checks 'Learn more' link" do
          product_details.should_see_learn_more_link
        end

        step "User checks product payment details" do
          product_details.should_see_reviews_number
        end

        step "User checks product sizes guide link" do
          product_details.should_see_sizes_guide_link
        end

        step "User checks product sizes items", %w(XS S M L) do |sizes|
          sizes.each { |size|
            product_details.should_see_size_item size
          }
        end

        step "User checks 'Add to bag' button" do
          product_details.click_add_to_bag_button
        end

        step "User checks Social Share buttons", %w(facebook twitter pinterest) do |social_sharing_buttons|
          social_sharing_buttons.each { |button|
            product_details.should_see_social_share_button button
          }
        end

        step "User checks section 'You may also like'" do
          product_details.should_see_bottom_section_item 'You May Also Like', 'THE JESSIE MIDI'
          product_details.should_see_bottom_section_item 'You May Also Like', 'THE JESSIE MIDI | New'
        end

        step "User checks section 'Complete the look'" do
          product_details.should_see_bottom_section_item 'Complete the Look', 'WHAT IF MAXI DRESS | New'
          product_details.should_see_bottom_section_item 'Complete the Look', 'THE BLUFFS MAXI DRESS | New'
        end

      end
    end
  end
end