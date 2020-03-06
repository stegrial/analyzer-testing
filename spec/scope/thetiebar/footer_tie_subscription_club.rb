require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

subscription_page = TheTiebarSubscriptionPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Footer: CUSTOM TIES AND ACCESSORIES' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['subscription_page'] do |url|
        page.visit url
      end

      step "User  select skinny ties 2.5'' radio button" do
        subscription_page.click_skinny_ties_25
      end

      step "User add button" do
        subscription_page.click_add_1
      end

      step "User click free place to close cart modal" do
        subscription_page.click_free_place
      end

      step "User  select neck ties 3.25'' radio button" do
        subscription_page.click_neck_ties_325
      end

      step "User add button" do
        subscription_page.click_add_2
      end

      step "User click free place to close cart modal" do
        subscription_page.click_free_place
      end

      step "User  select bow ties 12 radio button" do
        subscription_page.click_bow_ties_12
      end

      step "User add button" do
        subscription_page.click_add_3
      end

      step "User click free place to close cart modal" do
        subscription_page.click_free_place
      end

      step "User  select pairs socks 12 radio button" do
        subscription_page.click_pairs_socks_12
      end

      step "User add button" do
        subscription_page.click_add_4
      end

      step "User click free place to close cart modal" do
        subscription_page.click_free_place
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['subscription_page'] do |url|
        page.visit url
      end

      step "User  select skinny ties 2.5'' radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::SKINNY_TIES_25_TA, TheTiebarSubscriptionPage::SKINNY_TIES_25_IL
        subscription_page.click_skinny_ties_25
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART1_TA, TheTiebarSubscriptionPage::ADD_TO_CART1_IL
        subscription_page.click_add_1
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_TA, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place
      end

      step "User  select neck ties 3.25'' radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::NECK_TIES_325_TA, TheTiebarSubscriptionPage::NECK_TIES_325_IL
        subscription_page.click_neck_ties_325
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART2_TA, TheTiebarSubscriptionPage::ADD_TO_CART2_IL
        subscription_page.click_add_2
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_TA, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place
      end

      step "User  select bow ties 12 radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::BOW_TIES_12_TA, TheTiebarSubscriptionPage::BOW_TIES_12_IL
        subscription_page.click_bow_ties_12
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART3_TA, TheTiebarSubscriptionPage::ADD_TO_CART3_IL
        subscription_page.click_add_3
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_TA, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place
      end

      step "User  select pairs socks 12 radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::PAIRS_SOCKS_12_TA, TheTiebarSubscriptionPage::PAIRS_SOCKS_12_IL
        subscription_page.click_pairs_socks_12
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART4_TA, TheTiebarSubscriptionPage::ADD_TO_CART4_IL
        subscription_page.click_add_4
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_TA, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['subscription_page'] do |url|
        page.visit url
      end

      step "User  select skinny ties 2.5'' radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::SKINNY_TIES_25_EP, TheTiebarSubscriptionPage::SKINNY_TIES_25_IL
        subscription_page.click_skinny_ties_25 :ep
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART1_EP, TheTiebarSubscriptionPage::ADD_TO_CART1_IL
        subscription_page.click_add_1 :ep
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_EP, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place :ep
      end

      step "User  select neck ties 3.25'' radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::NECK_TIES_325_EP, TheTiebarSubscriptionPage::NECK_TIES_325_IL
        subscription_page.click_neck_ties_325 :ep
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART2_EP, TheTiebarSubscriptionPage::ADD_TO_CART2_IL
        subscription_page.click_add_2 :ep
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_EP, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place :ep
      end

      step "User  select bow ties 12 radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::BOW_TIES_12_EP, TheTiebarSubscriptionPage::BOW_TIES_12_IL
        subscription_page.click_bow_ties_12 :ep
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART3_EP, TheTiebarSubscriptionPage::ADD_TO_CART3_IL
        subscription_page.click_add_3 :ep
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_EP, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place :ep
      end

      step "User  select pairs socks 12 radio button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::PAIRS_SOCKS_12_EP, TheTiebarSubscriptionPage::PAIRS_SOCKS_12_IL
        subscription_page.click_pairs_socks_12 :ep
      end

      step "User add button" do
        check_element_path :xpath, TheTiebarSubscriptionPage::ADD_TO_CART4_EP, TheTiebarSubscriptionPage::ADD_TO_CART4_IL
        subscription_page.click_add_4 :ep
      end

      step "User click free place to close cart modal" do
        check_element_path :xpath, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_EP, TheTiebarSubscriptionPage::CLICK_FREE_PLACE_IL
        subscription_page.click_free_place :ep
      end

    end
  end
end