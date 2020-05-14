require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
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
        home_page.visit url
        banner_page.close_banner
      end

      step "Search items"  do |value|
        banner_page.close_banner
        home_page.fill_search_input(value)
      end
      step "Check cart"  do
        home_page.move_to_cart_link
      end

      step "Click View Cart"  do
        home_page.click_view_cart_btn
      end

      step "Click to cart link"  do
        home_page.click_cart_link
      end
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "Search items"  do |value|
        banner_page.close_banner
        check_element_path :xpath, HomePage::SEARCH_FIELD_TA, HomePage::SEARCH_FIELD_IL
        home_page.fill_search_input(value)
      end
      step "Check cart"  do
        check_element_path :xpath, HomePage::CART_LINK_TA, HomePage::CART_LINK_IL
        home_page.move_to_cart_link
      end

      step "Click View Cart"  do
        check_element_path :xpath, HomePage::VIEW_CART_TA, HomePage::VIEW_CART_IL
        home_page.click_view_cart_btn
      end

      step "Click to cart link"  do
        check_element_path :xpath, HomePage::CART_LINK_TA, HomePage::CART_LINK_IL
        home_page.click_cart_link
      end
    end
  end
end
