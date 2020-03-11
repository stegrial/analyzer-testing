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

      step "User checks product image", 'GLOWY GET' do |color|
        product_details.find_product_image color
      end

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

      step "User fills Search Field", 'RUTH TUNIC | New' do |value|
        check_element_path(:xpath, product_details.fill_search_field(:ta, value),
                           product_details.fill_search_field(:il, value))
        product_details.fill_search_field value
      end

      step "User clicks Search Suggestions item", 'ruth tunic new' do |value|
        check_element_path(:xpath, product_details.click_search_item(:ta, value),
                           product_details.click_search_item(:il, value))
        product_details.click_search_item :ta, value
      end

      step "User checks found items",
           'RUTH TUNIC | New', 'ruth-runic?', 'ruth-runic-1?', 2 do |name, link1, link2, number|
        check_element_path(:xpath, product_details.total_items(:ta, number),
                           product_details.total_items(:il, number))
        check_element_path(:xpath, product_details.collection_item_by_link(:ta, name, link1),
                           product_details.collection_item_by_link(:il, name, link1))
        check_element_path(:xpath, product_details.collection_item_by_link(:ta, name, link2),
                           product_details.collection_item_by_link(:il, name, link2))
        product_details.total_items :ta, number
        product_details.find_collection_item :ta, name, link: link1
        product_details.find_collection_item :ta, name, link: link2
      end

    end

  end
end