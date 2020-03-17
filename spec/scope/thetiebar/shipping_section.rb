require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new
cart_page = TheTiebarCartPage.new
header_page = TheTiebarHeader.new
checkout_page = TheTiebarCheckoutPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Add product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        sleep 3
        header_page.click_socks_category :il
      end

      step "User clicks the second socks on product page" do
        product_page.click_second_socks :il
      end

      step "User clicks the add to cart button" do
        product_page.click_add_to_cart_btn :il
      end

      step "User clicks the checkout now button" do
        cart_page.click_checkout_now_btn_modal :il
      end

      step "User click guest checkout" do
        checkout_page.click_guest_checkout
      end

      step "User fill guest email", "test@email.com" do |guest_email|
        checkout_page.fill_guest_email guest_email
      end

      step "User click continue as guest button" do
        checkout_page.click_continue_as_guest
      end

      step "User fill first name field", "Jon" do |name|
        checkout_page.fill_first_name name
      end

      step "User fill last name field", "Tester" do |last_name|
        checkout_page.fill_last_name last_name
      end

        step "User fill company name field", "BigWorld" do |company_name|
        checkout_page.fill_company company_name
      end

        step "User fill country field", "United States" do |usa|
        checkout_page.fill_country_field usa
          sleep 2
      end

      step "User fill address field", "Av" do |street|
        checkout_page.fill_address_field street
        sleep 2
      end

      step "User fill select address from dropdown field" do
        checkout_page.click_select_address_field
      end

      step "User click continue to pay btn" do
        checkout_page.click_continue_to_pay_btn
      end

      step "User click use entered address in modal  " do
        checkout_page.click_use_entered_address
      end

      step "User click continue button  " do
        checkout_page.click_continue_btn
      end

      step "User fill credit card field", settings('thetiebar')['master_card'] do |mastercard|
        checkout_page.fill_credit_card_field mastercard
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_month'] do |exp_data_month|
        checkout_page.fill_exp_month_field exp_data_month
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_year'] do |exp_data_year|
        checkout_page.fill_exp_year_field exp_data_year
      end

      step "User fill cvv field", "1111" do |billing|
        checkout_page.fill_billing_zip_field billing
      end

      step "User fill cvv field", settings('thetiebar')['cvc_cvv'] do |cvv|
        checkout_page.fill_cvc_cvv_field cvv
      end

      step "User click continue to review field" do
        checkout_page.click_continue_to_review
      end

      step "User click place to review field" do
        checkout_page.click_place_to_order
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        sleep 3
        check_element_path :xpath, TheTiebarHeader::SOCKS_CATEGORY_TA, TheTiebarHeader::SOCKS_CATEGORY_IL
        header_page.click_socks_category :il
      end

      step "User clicks the second socks on product page" do
        check_element_path :xpath, TheTiebarProductPage::SECOND_SOCKS_PDP_TA, TheTiebarProductPage::SECOND_SOCKS_PDP_IL
        product_page.click_second_socks :il
      end

      step "User clicks the add to cart button" do
        check_element_path :xpath, TheTiebarProductPage::ADD_TO_CART_TA, TheTiebarProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart_btn :il
      end

      step "User clicks the checkout now button" do
        check_element_path :xpath, TheTiebarCartPage::CHECKOUT_NOW_BTN_MODAL_TA, TheTiebarCartPage::CHECKOUT_NOW_BTN_MODAL_IL
        cart_page.click_checkout_now_btn_modal :il
      end

      step "User click guest checkout" do
        check_element_path :xpath, TheTiebarCheckoutPage::GUEST_CHECKOUT_TA, TheTiebarCheckoutPage::GUEST_CHECKOUT_IL
        checkout_page.click_guest_checkout
      end

      step "User fill guest email", "test@email.com" do |guest_email|
        check_element_path :xpath, TheTiebarCheckoutPage::GUEST_EMAIL_TA, TheTiebarCheckoutPage::GUEST_EMAIL_IL
        checkout_page.fill_guest_email guest_email
      end

      step "User click continue as guest button" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_AS_GUEST_TA, TheTiebarCheckoutPage::CONTINUE_AS_GUEST_IL
        checkout_page.click_continue_as_guest
      end

      step "User fill first name field", "Jon" do |name|
        check_element_path :xpath, TheTiebarCheckoutPage::FIRST_NAME_TA, TheTiebarCheckoutPage::FIRST_NAME_IL
        checkout_page.fill_first_name name
      end

      step "User fill last name field", "Tester" do |last_name|
        check_element_path :xpath, TheTiebarCheckoutPage::LAST_NAME_TA, TheTiebarCheckoutPage::LAST_NAME_IL
        checkout_page.fill_last_name last_name
      end

      step "User fill company name field", "BigWorld" do |company_name|
        check_element_path :xpath, TheTiebarCheckoutPage::COMPANY_TA, TheTiebarCheckoutPage::COMPANY_IL
        checkout_page.fill_company company_name
      end

      step "User fill country field", "United States" do |usa|
        check_element_path :xpath, TheTiebarCheckoutPage::COUNTRY_FIELD_TA, TheTiebarCheckoutPage::COUNTRY_FIELD_IL
        checkout_page.fill_country_field usa
      end

      step "User fill address field", "Av" do |street|
        check_element_path :xpath, TheTiebarCheckoutPage::ADDRESS_FIELD_TA, TheTiebarCheckoutPage::ADDRESS_FIELD_IL
        checkout_page.fill_address_field street
      end

      step "User fill select address from dropdown field" do
        check_element_path :xpath, TheTiebarCheckoutPage::SELECT_ADDRESS_TA, TheTiebarCheckoutPage::SELECT_ADDRESS_IL
        checkout_page.click_select_address_field
      end

      step "User click continue to pay btn" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_TO_PAY_BTN_TA, TheTiebarCheckoutPage::CONTINUE_TO_PAY_BTN_IL
        checkout_page.click_continue_to_pay_btn
      end

      step "User click use entered address in modal  " do
        check_element_path :xpath, TheTiebarCheckoutPage::USE_ENTERED_ADDRESS_TA, TheTiebarCheckoutPage::USE_ENTERED_ADDRESS_IL
        checkout_page.click_use_entered_address
      end

      step "User click continue button  " do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_BTN_TA, TheTiebarCheckoutPage::CONTINUE_BTN_IL
        checkout_page.click_continue_btn
      end

      step "User fill credit card field", settings('thetiebar')['master_card'] do |mastercard|
        check_element_path :xpath, TheTiebarCheckoutPage::CREDIT_CARD_TA, TheTiebarCheckoutPage::CREDIT_CARD_IL
        checkout_page.fill_credit_card_field mastercard
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_month'] do |exp_data_month|
        check_element_path :xpath, TheTiebarCheckoutPage::EXP_MONTH_TA, TheTiebarCheckoutPage::EXP_MONTH_IL
        checkout_page.fill_exp_month_field exp_data_month
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_year'] do |exp_data_year|
        check_element_path :xpath, TheTiebarCheckoutPage::EXP_YEAR_TA, TheTiebarCheckoutPage::EXP_YEAR_IL
        checkout_page.fill_exp_year_field exp_data_year
      end

      step "User fill cvv field", "1111" do |billing|
        check_element_path :xpath, TheTiebarCheckoutPage::BILLING_ZIP_TA, TheTiebarCheckoutPage::BILLING_ZIP_IL
        checkout_page.fill_billing_zip_field billing
      end

      step "User fill cvv field", settings('thetiebar')['cvc_cvv'] do |cvv|
        check_element_path :xpath, TheTiebarCheckoutPage::CVC_CVV_TA, TheTiebarCheckoutPage::CVC_CVV_IL
        checkout_page.fill_cvc_cvv_field cvv
      end

      step "User click continue to review field" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_TO_REVIEW_BTN_TA, TheTiebarCheckoutPage::CONTINUE_TO_REVIEW_BTN_IL
        checkout_page.click_continue_to_review
      end

      step "User click place to review field" do
        check_element_path :xpath, TheTiebarCheckoutPage::PLACE_ORDER_BTN_TA, TheTiebarCheckoutPage::PLACE_ORDER_BTN_IL
        checkout_page.click_place_to_order
      end


    end

  # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        sleep 3
        check_element_path :xpath, TheTiebarHeader::SOCKS_CATEGORY_EP, TheTiebarHeader::SOCKS_CATEGORY_IL
        header_page.click_socks_category :il
      end

      step "User clicks the second socks on product page" do
        check_element_path :xpath, TheTiebarProductPage::SECOND_SOCKS_PDP_EP, TheTiebarProductPage::SECOND_SOCKS_PDP_IL
        product_page.click_second_socks :il
      end

      step "User clicks the add to cart button" do
        check_element_path :xpath, TheTiebarProductPage::ADD_TO_CART_EP, TheTiebarProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart_btn :il
      end

      step "User clicks the checkout now button" do
        check_element_path :xpath, TheTiebarCartPage::CHECKOUT_NOW_BTN_MODAL_EP, TheTiebarCartPage::CHECKOUT_NOW_BTN_MODAL_IL
        cart_page.click_checkout_now_btn_modal :il
      end

      step "User click guest checkout" do
        check_element_path :xpath, TheTiebarCheckoutPage::GUEST_CHECKOUT_EP, TheTiebarCheckoutPage::GUEST_CHECKOUT_IL
        checkout_page.click_guest_checkout :ep
      end

      step "User fill guest email", "test@email.com" do |guest_email|
        check_element_path :xpath, TheTiebarCheckoutPage::GUEST_EMAIL_EP, TheTiebarCheckoutPage::GUEST_EMAIL_IL
        checkout_page.fill_guest_email :ep, guest_email
      end

      step "User click continue as guest button" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_AS_GUEST_EP, TheTiebarCheckoutPage::CONTINUE_AS_GUEST_IL
        checkout_page.click_continue_as_guest :ep
      end

      step "User fill first name field", "Jon" do |name|
        check_element_path :xpath, TheTiebarCheckoutPage::FIRST_NAME_EP, TheTiebarCheckoutPage::FIRST_NAME_IL
        checkout_page.fill_first_name :ep, name
      end

      step "User fill last name field", "Tester" do |last_name|
        check_element_path :xpath, TheTiebarCheckoutPage::LAST_NAME_EP, TheTiebarCheckoutPage::LAST_NAME_IL
        checkout_page.fill_last_name  :ep, last_name
      end

      step "User fill company name field", "BigWorld" do |company_name|
        check_element_path :xpath, TheTiebarCheckoutPage::COMPANY_EP, TheTiebarCheckoutPage::COMPANY_IL
        checkout_page.fill_company :ep, company_name
      end

      step "User fill country field", "United States" do |usa|
        check_element_path :xpath, TheTiebarCheckoutPage::COUNTRY_FIELD_EP, TheTiebarCheckoutPage::COUNTRY_FIELD_IL
        checkout_page.fill_country_field :ep, usa
      end

      step "User fill address field", "Av" do |street|
        check_element_path :xpath, TheTiebarCheckoutPage::ADDRESS_FIELD_EP, TheTiebarCheckoutPage::ADDRESS_FIELD_IL
        checkout_page.fill_address_field :ep, street
      end

      step "User fill select address from dropdown field" do
        check_element_path :xpath, TheTiebarCheckoutPage::SELECT_ADDRESS_EP, TheTiebarCheckoutPage::SELECT_ADDRESS_IL
        checkout_page.click_select_address_field :ep
      end

      step "User click continue to pay btn" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_TO_PAY_BTN_EP, TheTiebarCheckoutPage::CONTINUE_TO_PAY_BTN_IL
        checkout_page.click_continue_to_pay_btn :ep
      end

      step "User click use entered address in modal  " do
        check_element_path :xpath, TheTiebarCheckoutPage::USE_ENTERED_ADDRESS_EP, TheTiebarCheckoutPage::USE_ENTERED_ADDRESS_IL
        checkout_page.click_use_entered_address :ep
      end

      step "User click continue button  " do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_BTN_EP, TheTiebarCheckoutPage::CONTINUE_BTN_IL
        checkout_page.click_continue_btn :ep
      end

      step "User fill credit card field", settings('thetiebar')['master_card'] do |mastercard|
        check_element_path :xpath, TheTiebarCheckoutPage::CREDIT_CARD_EP, TheTiebarCheckoutPage::CREDIT_CARD_IL
        checkout_page.fill_credit_card_field :ep, mastercard
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_month'] do |exp_data_month|
        check_element_path :xpath, TheTiebarCheckoutPage::EXP_MONTH_EP, TheTiebarCheckoutPage::EXP_MONTH_IL
        checkout_page.fill_exp_month_field :ep, exp_data_month
      end

      step "User fill credit card field", settings('thetiebar')['exp_data_year'] do |exp_data_year|
        check_element_path :xpath, TheTiebarCheckoutPage::EXP_YEAR_EP, TheTiebarCheckoutPage::EXP_YEAR_IL
        checkout_page.fill_exp_year_field :ep, exp_data_year
      end

      step "User fill cvv field", "1111" do |billing|
        check_element_path :xpath, TheTiebarCheckoutPage::BILLING_ZIP_EP, TheTiebarCheckoutPage::BILLING_ZIP_IL
        checkout_page.fill_billing_zip_field :ep, billing
      end

      step "User fill cvv field", settings('thetiebar')['cvc_cvv'] do |cvv|
        check_element_path :xpath, TheTiebarCheckoutPage::CVC_CVV_EP, TheTiebarCheckoutPage::CVC_CVV_IL
        checkout_page.fill_cvc_cvv_field :ep, cvv
      end

      step "User click continue to review field" do
        check_element_path :xpath, TheTiebarCheckoutPage::CONTINUE_TO_REVIEW_BTN_EP, TheTiebarCheckoutPage::CONTINUE_TO_REVIEW_BTN_IL
        checkout_page.click_continue_to_review :ep
      end

      step "User click place to review field" do
        check_element_path :xpath, TheTiebarCheckoutPage::PLACE_ORDER_BTN_EP, TheTiebarCheckoutPage::PLACE_ORDER_BTN_IL
        checkout_page.click_place_to_order :ep
      end
    end
  end
end