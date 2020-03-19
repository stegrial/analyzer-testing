require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = Home_Page.new
press_page = Press_Page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Select Press details on home page' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Press'" do
        home_page.click_companies"Press"
      end

      step "User clicks first catalog on the page" do
        press_page.close_banner
        press_page.click_first_catalog
      end

      step "User clicks Choose Items below" do
        press_page.click_choose_items
      end

      step "User selects first element" do
        press_page.select_size
      end

      step "User fills quantity" do
        press_page.set_quantity '2'
        press_page.close_banner
      end

      step "User adds item to cart" do
        press_page.add_to_card
      end
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Press'" do
        check_element_path :xpath, home_page.search_categories(:ta, 'Press'), home_page.search_categories(:il, 'Press')
        home_page.click_companies"Press"
      end

      step "User clicks first catalog on the page" do
        press_page.close_banner
        check_element_path :xpath, Press_Page::PRESS_CATALOG_TA, Press_Page::PRESS_CATALOG_IL
        press_page.click_first_catalog
      end

      step "User clicks Choose Items below" do
        check_element_path :xpath, Press_Page::CHOOSE_ITEMS_TA, Press_Page::CHOOSE_ITEMS_IL
        press_page.click_choose_items
      end

      step "User selects first element" do
        check_element_path :xpath, Press_Page::SELECT_SIZE_TA, Press_Page::SELECT_SIZE_IL
        press_page.select_size
      end

      step "User fills quantity" do
        check_element_path :xpath, Press_Page::QUANTITY_FIELD_TA, Press_Page::QUANTITY_FIELD_IL
        press_page.set_quantity '2'
        press_page.close_banner
      end

      step "User adds item to cart" do
        check_element_path :xpath, Press_Page::ADD_TO_CARD_TA, Press_Page::ADD_TO_CARD_IL
        press_page.add_to_card
      end
    end
  end
end
