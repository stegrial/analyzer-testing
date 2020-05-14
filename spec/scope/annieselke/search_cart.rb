require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

header_page = HeaderPage.new
banner_page = BannerPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Search items on home page and check cart' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        header_page.visit url
        banner_page.close_banner
      end

      step "Search items" do |value|
        banner_page.close_banner
        header_page.fill_search_input(value)
      end
      step "Check cart" do
        header_page.move_to_cart_link
      end

      step "Click View Cart" do
        header_page.click_view_cart_btn
      end

      step "Click to cart link" do
        header_page.click_cart_link :il # step is duplicated below
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        header_page.visit url
        banner_page.close_banner
      end

      step "Search items" do |value|
        banner_page.close_banner
        check_element_path :xpath, HeaderPage::SEARCH_FIELD_TA, HeaderPage::SEARCH_FIELD_IL
        header_page.fill_search_input(value)
      end
      step "Check cart" do
        check_element_path :xpath, HeaderPage::CART_LINK_TA, HeaderPage::CART_LINK_IL
        header_page.move_to_cart_link
      end

      step "Click View Cart" do
        check_element_path :xpath, HeaderPage::VIEW_CART_TA, HeaderPage::VIEW_CART_IL
        header_page.click_view_cart_btn
      end

      step "Click to cart link" do
        check_element_path :xpath, HeaderPage::CART_LINK_TA, HeaderPage::CART_LINK_IL
        header_page.click_cart_link
      end

      sleep 3
    end
  end
end