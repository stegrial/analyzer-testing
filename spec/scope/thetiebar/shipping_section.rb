require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new
cart_page = TheTiebarCartPage.new
header_page = TheTiebarHeader.new
checkout_page = TheTiebarCheckoutPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Add product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['main_page'] do |url|
          page.visit url
        end

        step "User clicks the accessories category" do
          header_page.click_accessories_category
        end

        step "User clicks the second square on product page" do
          product_page.click_second_square
        end

        step "User clicks the add to cart button" do
          product_page.click_add_to_cart_btn
        end

        step "User clicks the checkout now button" do
          cart_page.click_checkout_now_btn_modal
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
        end

        step "User fill address field", "AlaskaMid" do |street|
          checkout_page.fill_address_field street
        end

        step "User fill address two field", "AlaskaTop" do |street|
          checkout_page.fill_address_two_field street
        end

        step "User fill city field", "Anchorage" do |city|
          checkout_page.fill_city_field city
        end

        step "User fill state field", "Alaska" do |state|
          checkout_page.fill_state_field state
        end

        step "User fill zip field", "35816" do |zip|
          checkout_page.fill_zip_field zip
        end

        step "User fill phone field", "1111111111" do |phone|
          checkout_page.fill_phone_field phone
        end

        step "User click continue to pay btn" do
          checkout_page.click_continue_to_pay_btn
        end

        step "User click use entered address in modal" do
          checkout_page.click_use_entered_address
        end

        step "User click continue button" do
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

        sleep 3
      end
    end

  end
end
