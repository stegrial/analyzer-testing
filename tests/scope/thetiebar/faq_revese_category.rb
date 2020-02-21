require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

faq_page = TheTiebarFaqPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'FAQ page -  revise Categories' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User clicks international section" do
        faq_page.click_international_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks about the tiebar section" do
        faq_page.click_about_the_tiebar_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks sizing section" do
        faq_page.click_sizing_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        faq_page.click_products_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks styling section" do
        faq_page.click_styling_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks bulk wholysale section" do
        faq_page.click_bulk_wholesale_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        faq_page.click_returns_payment_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks shipping section" do
        faq_page.click_shipping_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks holiday section" do
        faq_page.click_holiday_section
      end

      step "User breadcrumb tiebar" do
        faq_page.click_breadcrumb_tiebar
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User clicks international section" do
        check_element_path :xpath, TheTiebarFaqPage::INTERNATIONAL_SECTION_TA, TheTiebarFaqPage::INTERNATIONAL_SECTION_IL
        faq_page.click_international_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks about the tiebar section" do
        check_element_path :xpath, TheTiebarFaqPage::ABOUT_THE_TIEBAR_SECTION_TA, TheTiebarFaqPage::ABOUT_THE_TIEBAR_SECTION_IL
        faq_page.click_about_the_tiebar_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks sizing section" do
        check_element_path :xpath, TheTiebarFaqPage::SIZING_SECTION_TA, TheTiebarFaqPage::SIZING_SECTION_IL
        faq_page.click_sizing_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        check_element_path :xpath, TheTiebarFaqPage::PRODUCTS_SECTION_TA, TheTiebarFaqPage::PRODUCTS_SECTION_IL
        faq_page.click_products_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks styling section" do
        check_element_path :xpath, TheTiebarFaqPage::STYLING_SECTION_TA, TheTiebarFaqPage::STYLING_SECTION_IL
        faq_page.click_styling_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks bulk wholysale section" do
        check_element_path :xpath, TheTiebarFaqPage::BULK_WHOLESALE_SECTION_TA, TheTiebarFaqPage::BULK_WHOLESALE_SECTION_IL
        faq_page.click_bulk_wholesale_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        check_element_path :xpath, TheTiebarFaqPage::RETURNS_PAYMENTS_SECTION_TA, TheTiebarFaqPage::RETURNS_PAYMENTS_SECTION_IL
        faq_page.click_returns_payment_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks shipping section" do
        check_element_path :xpath, TheTiebarFaqPage::SHIPPING_SECTION_TA, TheTiebarFaqPage::SHIPPING_SECTION_IL
        faq_page.click_shipping_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks holiday section" do
        check_element_path :xpath, TheTiebarFaqPage::HOLIDAY_SECTION_TA, TheTiebarFaqPage::HOLIDAY_SECTION_IL
        faq_page.click_holiday_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_TA, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User clicks international section" do
        check_element_path :xpath, TheTiebarFaqPage::INTERNATIONAL_SECTION_EP, TheTiebarFaqPage::INTERNATIONAL_SECTION_IL
        faq_page.click_international_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks about the tiebar section" do
        check_element_path :xpath, TheTiebarFaqPage::ABOUT_THE_TIEBAR_SECTION_EP, TheTiebarFaqPage::ABOUT_THE_TIEBAR_SECTION_IL
        faq_page.click_about_the_tiebar_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks sizing section" do
        check_element_path :xpath, TheTiebarFaqPage::SIZING_SECTION_EP, TheTiebarFaqPage::SIZING_SECTION_IL
        faq_page.click_sizing_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks products section" do
        check_element_path :xpath, TheTiebarFaqPage::PRODUCTS_SECTION_EP, TheTiebarFaqPage::PRODUCTS_SECTION_IL
        faq_page.click_products_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks styling section" do
        check_element_path :xpath, TheTiebarFaqPage::STYLING_SECTION_EP, TheTiebarFaqPage::STYLING_SECTION_IL
        faq_page.click_styling_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks bulk wholysale section" do
        check_element_path :xpath, TheTiebarFaqPage::BULK_WHOLESALE_SECTION_EP, TheTiebarFaqPage::BULK_WHOLESALE_SECTION_IL
        faq_page.click_bulk_wholesale_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks products section" do
        check_element_path :xpath, TheTiebarFaqPage::RETURNS_PAYMENTS_SECTION_EP, TheTiebarFaqPage::RETURNS_PAYMENTS_SECTION_IL
        faq_page.click_returns_payment_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks shipping section" do
        check_element_path :xpath, TheTiebarFaqPage::SHIPPING_SECTION_EP, TheTiebarFaqPage::SHIPPING_SECTION_IL
        faq_page.click_shipping_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks holiday section" do
        check_element_path :xpath, TheTiebarFaqPage::HOLIDAY_SECTION_EP, TheTiebarFaqPage::HOLIDAY_SECTION_IL
        faq_page.click_holiday_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_EP, TheTiebarFaqPage::TIE_BAR_BREADCRUMBS_IL
        faq_page.click_breadcrumb_tiebar :ep
      end
    end
  end
end