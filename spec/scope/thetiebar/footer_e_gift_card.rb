require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

gift_cart_page = TheTiebarGiftCartPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Footer: E-GIFT CARD' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['gift_cart_page'] do |url|
          page.visit url
        end

        step "User  select $100 amount button" do
          gift_cart_page.click_amount_100
        end

        step "User  select custom amount button" do
          gift_cart_page.click_custom_amount
        end

        step "User fill custom input field", "80" do |value|
          gift_cart_page.fill_custom_input_field value
        end

        step "User fill sender name field", "test_name" do |name|
          gift_cart_page.fill_sender_name name
        end

        step "User fill recipient name field", "test_name" do |name|
          gift_cart_page.fill_recipient_name name
        end

        step "User fill  recipient email field", "testemail@gmail.com" do |email|
          gift_cart_page.fill_recipient_email email
        end

        step "User fill gift message field", "test text" do |message|
          gift_cart_page.fill_gift_message message
        end

        step "User fill add e-gift card button" do
          gift_cart_page.click_add_e_gift_card
        end

        sleep 3
      end
    end

  end
end
