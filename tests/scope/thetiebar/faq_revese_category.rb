require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

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
        check_element_path :xpath, faq_page::INTERNATIONAL_SECTION_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_international_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks about the tiebar section" do
        check_element_path :xpath, faq_page::ABOUT_THE_TIEBAR_SECTION_TA, faq_page::ABOUT_THE_TIEBAR_SECTION_IL
        faq_page.click_about_the_tiebar_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks sizing section" do
        check_element_path :xpath, faq_page::SIZING_SECTION_TA, faq_page::SIZING_SECTION_IL
        faq_page.click_sizing_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        check_element_path :xpath, faq_page::PRODUCTS_SECTION_TA, faq_page::PRODUCTS_SECTION_IL
        faq_page.click_products_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks styling section" do
        check_element_path :xpath, faq_page::STYLING_SECTION_TA, faq_page::STYLING_SECTION_IL
        faq_page.click_styling_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks bulk wholysale section" do
        check_element_path :xpath, faq_page::BULK_WHOLESALE_SECTION_TA, faq_page::BULK_WHOLESALE_SECTION_IL
        faq_page.click_bulk_wholesale_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks products section" do
        check_element_path :xpath, faq_page::RETURNS_PAYMENTS_SECTION_TA, faq_page::RETURNS_PAYMENTS_SECTION_IL
        faq_page.click_returns_payment_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks shipping section" do
        check_element_path :xpath, faq_page::SHIPPING_SECTION_TA, faq_page::SHIPPING_SECTION_IL
        faq_page.click_shipping_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks holiday section" do
        check_element_path :xpath, faq_page::HOLIDAY_SECTION_TA, faq_page::HOLIDAY_SECTION_IL
        faq_page.click_holiday_section
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_TA, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['faq_page'] do |url|
        page.visit url
      end

      step "User clicks international section" do
        check_element_path :xpath, faq_page::INTERNATIONAL_SECTION_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_international_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks about the tiebar section" do
        check_element_path :xpath, faq_page::ABOUT_THE_TIEBAR_SECTION_EP, faq_page::ABOUT_THE_TIEBAR_SECTION_IL
        faq_page.click_about_the_tiebar_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks sizing section" do
        check_element_path :xpath, faq_page::SIZING_SECTION_EP, faq_page::SIZING_SECTION_IL
        faq_page.click_sizing_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks products section" do
        check_element_path :xpath, faq_page::PRODUCTS_SECTION_EP, faq_page::PRODUCTS_SECTION_IL
        faq_page.click_products_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar
      end

      step "User clicks styling section" do
        check_element_path :xpath, faq_page::STYLING_SECTION_EP, faq_page::STYLING_SECTION_IL
        faq_page.click_styling_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks bulk wholysale section" do
        check_element_path :xpath, faq_page::BULK_WHOLESALE_SECTION_EP, faq_page::BULK_WHOLESALE_SECTION_IL
        faq_page.click_bulk_wholesale_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks products section" do
        check_element_path :xpath, faq_page::RETURNS_PAYMENTS_SECTION_EP, faq_page::RETURNS_PAYMENTS_SECTION_IL
        faq_page.click_returns_payment_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks shipping section" do
        check_element_path :xpath, faq_page::SHIPPING_SECTION_EP, faq_page::SHIPPING_SECTION_IL
        faq_page.click_shipping_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end

      step "User clicks holiday section" do
        check_element_path :xpath, faq_page::HOLIDAY_SECTION_EP, faq_page::HOLIDAY_SECTION_IL
        faq_page.click_holiday_section :ep
      end

      step "User breadcrumb tiebar" do
        check_element_path :xpath, faq_page::TIE_BAR_BREADCRUMBS_EP, faq_page::INTERNATIONAL_SECTION_IL
        faq_page.click_breadcrumb_tiebar :ep
      end
    end
  end
end