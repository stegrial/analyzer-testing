require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/venus_pages/*.rb"

login_page = VenusLogin.new
product_page = VenusProduct.new
navigation_page = VenusNavigation.new
cart_page = VenusCart.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:each) do
    step "Remove added item from bag", settings('venus') do |data|
      page.visit data['cart_page']
      cart_page.click_remove_item_from_bag :il
    end
  end

  feature 'AT-112, TA returns the wrong element (Venus - Check items on the cart)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('venus') do |credentials|
        login_page.fill_email_field credentials['email']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
        sleep 3 # to wait for the page is loaded
      end

      step "User goes to the page product", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User chooses a size in the list", '8' do |size|
        scroll_to_element nil
        product_page.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown
        sleep 3 # wait for opens dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity qty
      end

      step "User clicks on the Add to bag button" do
        product_page.click_add_to_bag_button
        sleep 5 # wait for notification to disappear
      end

      step "User finds items on the cart" do
        navigation_page.find_items_on_cart
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('venus') do |credentials|
        check_element_path :id, VenusLogin::EMAIL_FIELD_TA, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field credentials['email']

        check_element_path :id, VenusLogin::PASS_FIELD_TA, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :id, VenusLogin::SIGN_IN_BTN_TA, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
        sleep 3 # to wait for the page is loaded
      end

      step "User goes to the page product", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User chooses a size in the list", '8' do |size|
        scroll_to_element nil
        check_element_path :xpath, product_page.list_size(:ta, size), product_page.list_size(:il, size)
        product_page.choose_list_size size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, VenusProduct::QTY_DROPDOWN_TA, VenusProduct::QTY_DROPDOWN_IL
        product_page.open_qty_dropdown
        sleep 3 # wait for opens dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, product_page.quantity(:ta, qty), product_page.quantity(:il, qty)
        product_page.select_quantity qty
      end

      step "User clicks on the Add to bag button" do
        check_element_path :xpath, VenusProduct::ADD_TO_BAG_BTN_TA, VenusProduct::ADD_TO_BAG_BTN_IL
        product_page.click_add_to_bag_button
        sleep 5 # wait for notification to disappear
      end

      2.times do
        step "User finds items on the cart" do
          check_element_path :xpath, VenusNavigation::CART_BUTTON_TA, VenusNavigation::CART_BUTTON_IL
          navigation_page.find_items_on_cart
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('venus') do |credentials|
        check_element_path :id, VenusLogin::EMAIL_FIELD_EP, VenusLogin::EMAIL_FIELD_IL
        login_page.fill_email_field :ep, credentials['email']

        check_element_path :id, VenusLogin::PASS_FIELD_EP, VenusLogin::PASS_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :id, VenusLogin::SIGN_IN_BTN_EP, VenusLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
        sleep 3 # to wait for the page is loaded
      end

      step "User goes to the page product", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User chooses a size in the list", '8' do |size|
        scroll_to_element nil
        check_element_path :xpath, product_page.list_size(:ep, size), product_page.list_size(:il, size)
        product_page.choose_list_size :ep, size
      end

      step "User opens dropdown to select the quantity of product" do
        check_element_path :xpath, VenusProduct::QTY_DROPDOWN_EP, VenusProduct::QTY_DROPDOWN_IL
        product_page.open_qty_dropdown :ep
        sleep 3 # wait for opens dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        check_element_path :xpath, product_page.quantity(:ep, qty), product_page.quantity(:il, qty)
        product_page.select_quantity :ep, qty
      end

      step "User clicks on the Add to bag button" do
        check_element_path :xpath, VenusProduct::ADD_TO_BAG_BTN_EP, VenusProduct::ADD_TO_BAG_BTN_IL
        product_page.click_add_to_bag_button :ep
        sleep 5 # wait for notification to disappear
      end

      2.times do
        step "User finds items on the cart" do
          check_element_path :xpath, VenusNavigation::CART_BUTTON_EP, VenusNavigation::CART_BUTTON_IL
          navigation_page.find_items_on_cart :ep
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('venus') do |credentials|
        login_page.fill_email_field :il, credentials['email']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
        sleep 3 # to wait for the page is loaded
      end

      step "User goes to the page product", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User chooses a size in the list", '8' do |size|
        scroll_to_element nil
        product_page.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown :il
        sleep 3 # wait for opens dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity :il, qty
      end

      step "User clicks on the Add to bag button" do
        product_page.click_add_to_bag_button :il
        sleep 5 # wait for notification to disappear
      end

      step "User finds items on the cart" do
        navigation_page.find_items_on_cart
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['login_page'] do |url|
        page.visit url
      end

      step "User do login", settings('venus') do |credentials|
        login_page.fill_email_field :il, credentials['email']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
        sleep 3 # to wait for the page is loaded
      end

      step "User goes to the page product", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~71~&ProductDisplayID=67473&sale=1' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User chooses a size in the list", '8' do |size|
        scroll_to_element nil
        product_page.choose_list_size :il, size
      end

      step "User opens dropdown to select the quantity of product" do
        product_page.open_qty_dropdown :il
        sleep 3 # wait for opens dropdown
      end

      step "User selects the quantity of product", '2' do |qty|
        product_page.select_quantity :il, qty
      end

      step "User clicks on the Add to bag button" do
        product_page.click_add_to_bag_button :il
        sleep 5 # wait for notification to disappear
      end

      2.times do
        step "User finds items on the cart" do
          navigation_page.find_items_on_cart
        end
      end

      sleep 3
    end


  end
end
