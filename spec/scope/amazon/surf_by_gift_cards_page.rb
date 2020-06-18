require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

header_navigation = HeaderNavigation.new
gift_card_page = GiftCardPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Deals and Promotions page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on deals today button" do
          header_navigation.click_gift_cards_btn
        end

        step "User clicks on birthdays button" do
          gift_card_page.click_birthdays_btn
        end

        step "User sees birthday_egift_cards text on page" do
          gift_card_page.should_see_birthday_egift_card
        end

        step "User sees animated email text on page" do
          gift_card_page.should_see_animated_email
        end

        step "User clicks second animated email on page" do
          gift_card_page.click_second_animated_email
        end

        step "User sees gift card design text" do
          gift_card_page.should_see_gift_card_design
        end

        step "User clicks animated button" do
          gift_card_page.click_animated_btn
        end

        step "User clicks amount 100 button" do
          gift_card_page.click_amount_100_btn
        end

        step "User clicks delivery text msg button" do
          gift_card_page.click_delivery_text_msg_btn
          end

        step "User fill mobile number field", "12345678" do |value|
          gift_card_page.fill_mobile_number value
        end

        step "User fill name field", "Tester" do |value|
          gift_card_page.fill_name_input value
        end

        step "User fill mobile number field", "test" do |value|
          gift_card_page.fill_message_input value
        end

        sleep 3
      end
    end

  end
end
