require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

category_page = VenusCategory.new
sub_category_page = VenusSubCategory.new
product_page = VenusProduct.new
navigation_page = VenusNavigation.new
login_page = VenusLogin.new
wish_list_page = VenusWishList.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-36, TA Analyzer returns a wrong element path after text of the element was changed (Venus - Product Size information)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button
      end

      step "User clicks on the Sale category" do
        navigation_page.click_sale_cat
      end

      step "User opens dropdown in the Sale category" do
        category_page.open_cat_dropdown
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name name
      end

      step "User chooses a product by name in the list", 'ribbed henley top' do |name|
        sub_category_page.choose_product_by_name name
      end

      step "User chooses a size in the list", 'L' do |size|
        scroll_to_element nil
        product_page.choose_list_size size
      end

      step "User chooses a size in the list", 'M' do |size|
        product_page.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity qty
      end

      step "User clicks on the + Wish List button" do
        product_page.click_wish_list_button
      end

      step "User observes the product size" do
        wish_list_page.observe_product_size
      end

      step "User clears the Wish List" do
        wish_list_page.click_remove_wish_list
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, VenusLogin::EMAIL_FIELD_TA, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, VenusLogin::PASS_FIELD_TA, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, VenusLogin::SIGN_IN_BTN_TA, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on the Sale category" do
        check_element_path :xpath, VenusNavigation::SALE_CAT_TA, VenusNavigation::SALE_CAT_IL
        navigation_page.click_sale_cat
      end

      step "User opens dropdown in the Sale category" do
        check_element_path :xpath, VenusCategory::CAT_DROPDOWN_TA, VenusCategory::CAT_DROPDOWN_IL
        category_page.open_cat_dropdown
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        check_element_path :xpath, category_page.subcat_name(:ta, name), category_page.subcat_name(:il, name)
        category_page.choose_subcat_by_first_name name
      end

      step "User chooses a product by name in the list", 'color block top' do |name|
        check_element_path :xpath, sub_category_page.product_name(:ta, name), sub_category_page.product_name(:il, name)
        sub_category_page.choose_product_by_name name
      end

      step "User chooses a size in the list", 'M' do |size|
        scroll_to_element nil
        check_element_path :xpath, product_page.list_size(:ta, size), product_page.list_size(:il, size)
        product_page.choose_list_size size
      end

      step "User chooses a size in the list", 'L' do |size|
        check_element_path :xpath, product_page.list_size(:ta, size), product_page.list_size(:il, size)
        product_page.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, VenusProduct::QTY_DROPDOWN_TA, VenusProduct::QTY_DROPDOWN_IL
        product_page.open_qty_dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, product_page.quantity(:ta, qty), product_page.quantity(:il, qty)
        product_page.select_quantity qty
      end

      step "User clicks on the + Wish List button" do
        check_element_path :xpath, VenusProduct::WISH_LIST_BTN_TA, VenusProduct::WISH_LIST_BTN_IL
        product_page.click_wish_list_button
      end

      step "User observes the product size" do
        check_element_path :xpath, VenusWishList::PRODUCT_SIZE_TA, VenusWishList::PRODUCT_SIZE_IL
        wish_list_page.observe_product_size
      end

      step "User clears the Wish List" do
        check_element_path :xpath, VenusWishList::REMOVE_WISH_LIST_BTN_TA, VenusWishList::REMOVE_WISH_LIST_BTN_IL
        wish_list_page.click_remove_wish_list
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        check_element_path :id, VenusLogin::EMAIL_FIELD_EP, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field :ep, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        check_element_path :id, VenusLogin::PASS_FIELD_EP, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :id, VenusLogin::SIGN_IN_BTN_EP, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User clicks on the Sale category" do
        check_element_path :xpath, VenusNavigation::SALE_CAT_EP, VenusNavigation::SALE_CAT_IL
        navigation_page.click_sale_cat :ep
      end

      step "User opens dropdown in the Sale category" do
        check_element_path :xpath,  VenusCategory::CAT_DROPDOWN_EP, VenusCategory::CAT_DROPDOWN_IL
        category_page.open_cat_dropdown :ep
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        check_element_path :xpath, category_page.subcat_name(:ep, name), category_page.subcat_name(:il, name)
        category_page.choose_subcat_by_first_name :ep, name
      end

      step "User chooses a product by name in the list", 'color block top' do |name|
        check_element_path :xpath, sub_category_page.product_name(:ep, name), sub_category_page.product_name(:il, name)
        sub_category_page.choose_product_by_name name
      end

      step "User chooses a size in the list", 'M' do |size|
        scroll_to_element nil
        check_element_path :xpath, product_pageit.list_size(:ep, size), product_page.list_size(:il, size)
        product_page.choose_list_size :ep, size
      end

      step "User chooses a size in the list", 'L' do |size|
        check_element_path :xpath, product_page.list_size(:ep, size), product_page.list_size(:il, size)
        product_page.choose_list_size :ep, size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, VenusProduct::QTY_DROPDOWN_EP, VenusProduct::QTY_DROPDOWN_IL
        product_page.open_qty_dropdown :ep
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, product_page.quantity(:ep, qty), product_page.quantity(:il, qty)
        product_page.select_quantity :ep, qty
      end

      step "User clicks on the + Wish List button" do
        check_element_path :xpath, VenusProduct::WISH_LIST_BTN_EP, VenusProduct::WISH_LIST_BTN_IL
        product_page.click_wish_list_button :ep
      end

      step "User observes the product size" do
        check_element_path :xpath, VenusWishList::PRODUCT_SIZE_EP, VenusWishList::PRODUCT_SIZE_IL
        wish_list_page.observe_product_size :ep
      end

      step "User clears the Wish List" do
        check_element_path :xpath, VenusWishList::REMOVE_WISH_LIST_BTN_EP, VenusWishList::REMOVE_WISH_LIST_BTN_IL
        wish_list_page.click_remove_wish_list :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Sale category" do
        navigation_page.click_sale_cat :il
      end

      step "User opens dropdown in the Sale category" do
        category_page.open_cat_dropdown :il
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name :il, name
      end

      step "User chooses a product by name in the list", 'color block top' do |name|
        sub_category_page.choose_product_by_name name
      end
=begin can't reproduce: TA-999 (new issue TA-1000)
      step "User chooses a size in the list", 'L' do |size|
        scroll_to_element nil
        product_page.choose_list_size :il, size
      end

      step "User chooses a size in the list", 'M' do |size|
        product_page.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown :il
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity :il, qty
      end

      step "User clicks on the + Wish List button" do
        product_page.click_wish_list_button :il
      end

      step "User observes the product size" do
        wish_list_page.observe_product_size
      end

      step "User clears the Wish List" do
        wish_list_page.click_remove_wish_list :il
      end
=end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Sale category" do
        navigation_page.click_sale_cat :il
      end

      step "User opens dropdown in the Sale category" do
        category_page.open_cat_dropdown :il
        sleep 2 # need to wait loading the dropdown with subcategories
      end

      step "User chooses the subcategory in the dropdown",'Clothing Sale', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name :il, name
      end

      step "User chooses a product by name in the list", 'color block top' do |name|
        sub_category_page.choose_product_by_name name
      end
=begin can't reproduce: TA-999 (new issue TA-1000)
      step "User chooses a size in the list", 'M' do |size|
        scroll_to_element nil
        product_page.choose_list_size :il, size
      end

      step "User chooses a size in the list", 'L' do |size|
        product_page.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown :il
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity :il, qty
      end

      step "User clicks on the + Wish List button" do
        product_page.click_wish_list_button :il
      end

      step "User observes the product size" do
        wish_list_page.observe_product_size
      end

      step "User clears the Wish List" do
        wish_list_page.click_remove_wish_list :il
      end
=end
      sleep 3
    end


  end
end
