require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
store_finder_page = StoreFinderPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Search brand stores' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Store Finder'" do
        home_page.click_companies"Store Finder"
      end

      step "User enters City" do
        store_finder_page.set_city "Odessa"
      end

      step "User selects brand" , "da"  do |value|
        store_finder_page.click_dropdown_arrow_brand
        store_finder_page.select_brand value
        home_page.close_banner
      end

      step "User clicks Search" do
        store_finder_page.click_search_btn
      end

      step "User clicks Find store" do
        store_finder_page.click_find_store
      end

    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Store Finder'" do
        check_element_path :xpath, home_page.search_categories(:ta, 'Store Finder'), home_page.search_categories(:il, 'Store Finder')
        home_page.click_companies"Store Finder"
      end

      step "User enters City" do
        check_element_path :xpath, StoreFinderPage::CITY_TA, StoreFinderPage::CITY_IL
        store_finder_page.set_city "Odessa"
      end

      step "User selects brand" , "da"  do |value|
        check_element_path :xpath, StoreFinderPage::BRAND_TA, StoreFinderPage::BRAND_IL
        store_finder_page.click_dropdown_arrow_brand

        check_element_path :xpath, store_finder_page.search_brand_item(:ta, value), store_finder_page.search_brand_item(:il, value)
        store_finder_page.select_brand value
        home_page.close_banner
      end

      step "User clicks Search" do
        check_element_path :xpath, StoreFinderPage::SEARCH_BTN_TA, StoreFinderPage::SEARCH_BTN_IL
        store_finder_page.click_search_btn
      end

      step "User clicks Find store" do
        check_element_path :xpath, StoreFinderPage::FIND_STORE_BTN_TA, StoreFinderPage::FIND_STORE_BTN_IL
        store_finder_page.click_find_store
      end
    end
  end
end
