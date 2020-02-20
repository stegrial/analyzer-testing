require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

footer_page = TheTiebarFooterPage.new
faq_page = TheTiebarFaqPage.new
about_us_page = TheTiebarAboutUs.new
canada_page = TheTiebarCanada.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Footer: Need help? section' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Contact link" do
        footer_page.click_contact
        footer_page.should_see_contact_h1
      end

      step "User clicks on the Shipping link" do
        footer_page.click_shipping
        footer_page.should_see_shipping_h1
      end

      step "User clicks on the Returns link" do
        footer_page.click_returns
        footer_page.should_see_returns_h1
      end

      step "User clicks on the Track My Order link" do
        footer_page.click_track_my_orders
        footer_page.should_see_track_my_order_h1
      end

      step "User clicks on the About Us link" do
        footer_page.click_about_us
        footer_page.should_see_about_us_h1
      end

      step "User clicks on the About Us Stores link" do
        footer_page.click_about_our_stores
        about_us_page.should_see_about_our_stores_h1
      end

      step "User clicks on the FAQ link" do
        footer_page.click_faq
        footer_page.should_see_faq_h1
      end

      step "User clicks on return to the tiebar link in top" do
        faq_page.click_return_to_the_tiebar
      end

      step "User clicks on the Careers link" do
        footer_page.click_careers
        footer_page.should_see_current_posittions_h1
      end

      step "User clicks on the Canada link" do
        footer_page.click_canada
        canada_page.should_see_canada_h1
      end

      step "User clicks on the Promotions link" do
        footer_page.click_promotions
        footer_page.should_see_promotions_h1
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Contact link" do
        check_element_path :xpath, TheTiebarFooterPage::CONTACT_TA, TheTiebarFooterPage::CONTACT_IL
        footer_page.click_contact
        check_element_path :xpath, TheTiebarFooterPage::CONTACT_US_H1_TA, TheTiebarFooterPage::CONTACT_US_H1_IL
        footer_page.should_see_contact_h1
      end

      step "User clicks on the Shipping link" do
        check_element_path :xpath, TheTiebarFooterPage::SHIPPING_TA, TheTiebarFooterPage::SHIPPING_IL
        footer_page.click_shipping
        check_element_path :xpath, TheTiebarFooterPage::SHIPPING_H1_TA, TheTiebarFooterPage::SHIPPING_H1_IL
        footer_page.should_see_shipping_h1
      end

      step "User clicks on the Returns link" do
        check_element_path :xpath, TheTiebarFooterPage::RETURNS_TA, TheTiebarFooterPage::RETURNS_IL
        footer_page.click_returns
        check_element_path :xpath, TheTiebarFooterPage::RETURNS_H1_TA, TheTiebarFooterPage::RETURNS_H1_IL
        footer_page.should_see_returns_h1
      end

      step "User clicks on the Track My Order link" do
        check_element_path :xpath, TheTiebarFooterPage::TRACK_MY_ORDER_TA, TheTiebarFooterPage::TRACK_MY_ORDER_H1_IL
        footer_page.click_track_my_orders
        check_element_path :xpath, TheTiebarFooterPage::TRACK_MY_ORDER_H1_TA, TheTiebarFooterPage::TRACK_MY_ORDER_H1_IL
        footer_page.should_see_track_my_order_h1
      end

      step "User clicks on the About Us link" do
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_US_TA, TheTiebarFooterPage::ABOUT_US_IL
        footer_page.click_about_us
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_US_H1_TA, TheTiebarFooterPage::ABOUT_US_H1_IL
        footer_page.should_see_about_us_h1
      end

      step "User clicks on the About Us Stores link" do
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_OUR_STORES_TA, TheTiebarFooterPage::ABOUT_OUR_STORES_IL
        footer_page.click_about_our_stores
        check_element_path :xpath, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_TA, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_IL
        about_us_page.should_see_about_our_stores_h1
      end

      step "User clicks on the FAQ link" do
        check_element_path :xpath, TheTiebarFooterPage::FAQ_TA, TheTiebarFooterPage::FAQ_IL
        footer_page.click_faq
        check_element_path :xpath, TheTiebarFooterPage::FAQ_H1_TA, TheTiebarFooterPage::FAQ_H1_IL
        footer_page.should_see_faq_h1
      end

      step "User clicks on return to the tiebar link in top" do
        check_element_path :xpath, TheTiebarFaqPage::RETURN_TO_THE_TIE_BAR_LINK_TA, TheTiebarFaqPage::RETURN_TO_THE_TIE_BAR_LINK_IL
        faq_page.click_return_to_the_tiebar
      end

      step "User clicks on the Careers link" do
        check_element_path :xpath, TheTiebarFooterPage::CAREERS_TA, TheTiebarFooterPage::CAREERS_IL
        footer_page.click_careers
        check_element_path :xpath, TheTiebarFooterPage::CURRENT_OPEN_POSITIONS_H1_TA, TheTiebarFooterPage::CURRENT_OPEN_POSITIONS_H1_IL
        footer_page.should_see_current_posittions_h1
      end

      step "User clicks on the Canada link" do
        check_element_path :xpath, TheTiebarFooterPage::CANADA_TA, TheTiebarFooterPage::CANADA_IL
        footer_page.click_canada
        check_element_path :xpath, TheTiebarCanada::THE_TIABAR_CANADA_H1_TA, TheTiebarCanada::THE_TIABAR_CANADA_H1_IL
        canada_page.should_see_canada_h1
      end

      step "User clicks on the Promotions link" do
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_TA, TheTiebarFooterPage::PROMOTIONS_IL
        footer_page.click_promotions
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_H1_TA, TheTiebarFooterPage::PROMOTIONS_H1_IL
        footer_page.should_see_promotions_h1
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks on the Contact link" do
        check_element_path :xpath, TheTiebarFooterPage::CONTACT_EP, TheTiebarFooterPage::CONTACT_IL
        footer_page.click_contact :ep
        check_element_path :xpath, TheTiebarFooterPage::CONTACT_US_H1_EP, TheTiebarFooterPage::CONTACT_US_H1_IL
        footer_page.should_see_contact_h1 :ep
      end

      step "User clicks on the Shipping link" do
        check_element_path :xpath, TheTiebarFooterPage::SHIPPING_EP, TheTiebarFooterPage::SHIPPING_IL
        footer_page.click_shipping :ep
        check_element_path :xpath, TheTiebarFooterPage::SHIPPING_H1_EP, TheTiebarFooterPage::SHIPPING_H1_IL
        footer_page.should_see_shipping_h1 :ep
      end

      step "User clicks on the Returns link" do
        check_element_path :xpath, TheTiebarFooterPage::RETURNS_EP, TheTiebarFooterPage::RETURNS_IL
        footer_page.click_returns :ep
        check_element_path :xpath, TheTiebarFooterPage::RETURNS_H1_EP, TheTiebarFooterPage::RETURNS_H1_IL
        footer_page.should_see_returns_h1 :ep
      end

      step "User clicks on the Track My Order link" do
        check_element_path :xpath, TheTiebarFooterPage::TRACK_MY_ORDER_TA, TheTiebarFooterPage::TRACK_MY_ORDER_H1_IL
        footer_page.click_track_my_orders :ep
        check_element_path :xpath, TheTiebarFooterPage::TRACK_MY_ORDER_H1_TA, TheTiebarFooterPage::TRACK_MY_ORDER_H1_IL
        footer_page.should_see_track_my_order_h1 :ep
      end

      step "User clicks on the About Us link" do
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_US_EP, TheTiebarFooterPage::ABOUT_US_IL
        footer_page.click_about_us :ep
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_US_H1_EP, TheTiebarFooterPage::ABOUT_US_H1_IL
        footer_page.should_see_about_us_h1 :ep
      end

      step "User clicks on the About Us Stores link" do
        check_element_path :xpath, TheTiebarFooterPage::ABOUT_OUR_STORES_EP, TheTiebarFooterPage::ABOUT_OUR_STORES_IL
        footer_page.click_about_our_stores :ep
        check_element_path :xpath, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_EP, TheTiebarAboutUs::ABOUT_OUR_STORES_H1_IL
        about_us_page.should_see_about_our_stores_h1 :ep
      end

      step "User clicks on the FAQ link" do
        check_element_path :xpath, TheTiebarFooterPage::FAQ_EP, TheTiebarFooterPage::FAQ_IL
        footer_page.click_faq :ep
        check_element_path :xpath, TheTiebarFooterPage::FAQ_H1_EP, TheTiebarFooterPage::FAQ_H1_IL
        footer_page.should_see_faq_h1 :ep
      end

      step "User clicks on return to the tiebar link in top" do
        check_element_path :xpath, TheTiebarFaqPage::RETURN_TO_THE_TIE_BAR_LINK_EP, TheTiebarFaqPage::RETURN_TO_THE_TIE_BAR_LINK_IL
        faq_page.click_return_to_the_tiebar :ep
      end

      step "User clicks on the Careers link" do
        check_element_path :xpath, TheTiebarFooterPage::CAREERS_EP, TheTiebarFooterPage::CAREERS_IL
        footer_page.click_careers :ep
        check_element_path :xpath, TheTiebarFooterPage::CURRENT_OPEN_POSITIONS_H1_EP, TheTiebarFooterPage::CURRENT_OPEN_POSITIONS_H1_IL
        footer_page.should_see_current_posittions_h1 :ep
      end

      step "User clicks on the Canada link" do
        check_element_path :xpath, TheTiebarFooterPage::CANADA_EP, TheTiebarFooterPage::CANADA_IL
        footer_page.click_canada :ep
        check_element_path :xpath, TheTiebarCanada::THE_TIABAR_CANADA_H1_EP, TheTiebarCanada::THE_TIABAR_CANADA_H1_IL
        canada_page.should_see_canada_h1 :ep
      end

      step "User clicks on the Promotions link" do
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_EP, TheTiebarFooterPage::PROMOTIONS_IL
        footer_page.click_promotions :ep
        check_element_path :xpath, TheTiebarFooterPage::PROMOTIONS_H1_EP, TheTiebarFooterPage::PROMOTIONS_H1_IL
        footer_page.should_see_promotions_h1 :ep
      end
    end
  end
end