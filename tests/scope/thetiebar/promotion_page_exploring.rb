require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

footer_page = TheTiebarFooterPage.new
promo_page = TheTiebarPromoPage.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Promotions page exploring' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Promotions link" do
        footer_page.click_promotions
        footer_page.should_see_promotions_h1
      end

      step "User clicks new arrivals button" do
        promo_page.click_new_arrivals_btn
      end

      step "User sees Whats New page" do
        promo_page.should_see_whats_new_h1
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Promotions link" do
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_TA, TheTiebarFooterPage::PROMOTIONS_IL
        footer_page.click_promotions
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_H1_TA, TheTiebarFooterPage::PROMOTIONS_H1_IL
        footer_page.should_see_promotions_h1
      end

      step "User clicks new arrivals button" do
        check_element_path :xpath, TheTiebarPromoPage::SHOP_NEW_ARRIVALS_BTN_TA, TheTiebarPromoPage::SHOP_NEW_ARRIVALS_BTN_IL
        promo_page.click_new_arrivals_btn
      end

      step "User sees Whats New page" do
        check_element_path :xpath, TheTiebarPromoPage::WHATS_NEW_H1_TA, TheTiebarPromoPage::WHATS_NEW_H1_IL
        promo_page.should_see_whats_new_h1
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Promotions link" do
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_EP, TheTiebarFooterPage::PROMOTIONS_IL
        footer_page.click_promotions :ep
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_H1_EP, TheTiebarFooterPage::PROMOTIONS_H1_IL
        footer_page.should_see_promotions_h1 :ep
      end

      step "User clicks new arrivals button" do
        check_element_path :xpath, TheTiebarPromoPage::SHOP_NEW_ARRIVALS_BTN_EP, TheTiebarPromoPage::SHOP_NEW_ARRIVALS_BTN_IL
        promo_page.click_new_arrivals_btn :ep
      end

      step "User sees Whats New page" do
        check_element_path :xpath, TheTiebarPromoPage::WHATS_NEW_H1_EP, TheTiebarPromoPage::WHATS_NEW_H1_IL
        promo_page.should_see_whats_new_h1 :ep
      end
    end

  end
end