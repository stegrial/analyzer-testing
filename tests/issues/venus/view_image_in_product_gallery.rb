require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/venus_pages/*.rb"

product_page = VenusProduct.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'Venus - View image in the gallery' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User is viewing the main product image", '1' do |image|
        product_page.find_main_image_on_product image
      end

      step "User clicks on the second photo in the product gallery", '2' do |image|
        product_page.choose_image image
      end

      step "User is viewing the main product image", '2' do |image|
        product_page.find_main_image_on_product image
      end

      step "User clicks on the third photo in the product gallery", '3' do |image|
        product_page.choose_image image
      end

      step "User is viewing the main product image", '3' do |image|
        product_page.find_main_image_on_product image
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User is viewing the main product image", '1' do |image|
        check_element_path :xpath, product_page.main_image(:ta, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product image
      end

      step "User clicks on the second photo in the product gallery", '2' do |image|
        check_element_path :xpath, product_page.image_gallery(:ta, image), product_page.image_gallery(:il, image)
        product_page.choose_image image
      end

      step "User is viewing the main product image", '2' do |image|
        check_element_path :xpath, product_page.main_image(:ta, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product image
      end

      step "User clicks on the third photo in the product gallery", '3' do |image|
        check_element_path :xpath, product_page.image_gallery(:ta, image), product_page.image_gallery(:il, image)
        product_page.choose_image image
      end

      step "User is viewing the main product image", '3' do |image|
        check_element_path :xpath, product_page.main_image(:ta, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product image
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User is viewing the main product image", '1' do |image|
        check_element_path :xpath, product_page.main_image(:ep, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product :ep, image
      end

      step "User clicks on the second photo in the product gallery", '2' do |image|
        check_element_path :xpath, product_page.image_gallery(:ep, image), product_page.image_gallery(:il, image)
        product_page.choose_image :ep, image
      end

      step "User is viewing the main product image", '2' do |image|
        check_element_path :xpath, product_page.main_image(:ep, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product :ep, image
      end

      step "User clicks on the third photo in the product gallery", '3' do |image|
        check_element_path :xpath, product_page.image_gallery(:ep, image), product_page.image_gallery(:il, image)
        product_page.choose_image :ep, image
      end

      step "User is viewing the main product image", '3' do |image|
        check_element_path :xpath, product_page.main_image(:ep, image), product_page.main_image(:il, image)
        product_page.find_main_image_on_product :ep, image
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User is viewing the main product image", '1' do |image|
        product_page.find_main_image_on_product image
      end

      step "User clicks on the second photo in the product gallery", '2' do |image|
        product_page.choose_image image
      end

      step "User is viewing the main product image", '2' do |image|
        product_page.find_main_image_on_product image
      end

      step "User clicks on the second photo in the product gallery", '3' do |image|
        product_page.choose_image image
      end

      step "User is viewing the main product image", '3' do |image|
        product_page.find_main_image_on_product image
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User is viewing the main product image", '1' do |image|
        product_page.find_main_image_on_product image
      end

      step "User clicks on the second photo in the product gallery", '3' do |image|
        product_page.choose_image image
      end

      step "User is viewing the main product image", '3' do |image|
        product_page.find_main_image_on_product image
      end

      sleep 3
    end


  end
end
