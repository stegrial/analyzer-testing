require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
press_page = PressPage.new
banner_page = BannerPage.new
footer_page = FooterPage.new

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
        banner_page.close_banner
      end

      step "User clicks 'Press'" do
        footer_page.click_companies "Press"
      end

      step "User clicks first catalog on the page" do
        banner_page.close_banner
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
        banner_page.close_banner
      end

      step "User adds item to cart" do
        press_page.add_to_card
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks 'Press'" do
        check_element_path :xpath, footer_page.search_categories(:ta, 'Press'), footer_page.search_categories(:il, 'Press')
        footer_page.click_companies "Press"
      end

      step "User clicks first catalog on the page" do
        banner_page.close_banner
        check_element_path :xpath, PressPage::PRESS_CATALOG_TA, PressPage::PRESS_CATALOG_IL
        press_page.click_first_catalog
      end

      step "User clicks Choose Items below" do
        check_element_path :xpath, PressPage::CHOOSE_ITEMS_TA, PressPage::CHOOSE_ITEMS_IL
        press_page.click_choose_items
      end

      step "User selects first element" do
        check_element_path :xpath, PressPage::SELECT_SIZE_TA, PressPage::SELECT_SIZE_IL
        press_page.select_size
      end

      step "User fills quantity" do
        check_element_path :xpath, PressPage::QUANTITY_FIELD_TA, PressPage::QUANTITY_FIELD_IL
        press_page.set_quantity '2'
        banner_page.close_banner
      end

      step "User adds item to cart" do
        check_element_path :xpath, PressPage::ADD_TO_CARD_TA, PressPage::ADD_TO_CARD_IL
        press_page.add_to_card
      end

      sleep 3
    end
  end
end
