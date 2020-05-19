require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
catalog_page = CatalogPage.new
request_catalog_page = RequestCatalogPage.new
banner_page = BannerPage.new
footer_page = FooterPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Request a current catalog' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks 'Catalog'" do
        footer_page.click_companies "Catalog"
      end

      step "User clicks Request a catalog" do
        catalog_page.click_request_catalog
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        request_catalog_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        request_catalog_page.fill_last_name(last_name)
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        request_catalog_page.fill_email(email)
      end

      step "User fills address" do
        request_catalog_page.fill_address 'Address'
      end

      step "User fills City" do
        request_catalog_page.fill_city 'City'
      end

      step "User selects state", "GA" do |value|
        request_catalog_page.click_dropdown_arrow_state
        request_catalog_page.select_dropdown_state value
      end

      step "User fills Zip Code" do
        request_catalog_page.fill_zip_code '48001'
      end

      step "User adds to email list" do
        request_catalog_page.click_add_email
      end

      step "User clicks Request a catalog button" do
        request_catalog_page.click_request_catalog
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks 'Catalog'" do
        check_element_path :xpath, footer_page.search_categories(:ta, 'Catalog'), footer_page.search_categories(:il, 'Catalog')
        footer_page.click_companies "Catalog"
      end

      step "User clicks Request a catalog" do
        check_element_path :xpath, CatalogPage::REQUEST_CATALOG_TA, CatalogPage::REQUEST_CATALOG_IL
        catalog_page.click_request_catalog
      end

      step "User fills first name", settings('annieselke')['first_name'] do |first_name|
        check_element_path :xpath, RequestCatalogPage::FIRST_NAME_TA, RequestCatalogPage::FIRST_NAME_IL
        request_catalog_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        check_element_path :xpath, RequestCatalogPage::LAST_NAME_TA, RequestCatalogPage::LAST_NAME_IL
        request_catalog_page.fill_last_name(last_name)
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        check_element_path :xpath, RequestCatalogPage::EMAIL_TA, RequestCatalogPage::EMAIL_IL
        request_catalog_page.fill_email(email)
      end

      step "User fills address" do
        check_element_path :xpath, RequestCatalogPage::EMAIL_TA, RequestCatalogPage::EMAIL_IL
        request_catalog_page.fill_address 'Address'
      end

      step "User fills City" do
        check_element_path :xpath, RequestCatalogPage::CITY_TA, RequestCatalogPage::CITY_IL
        request_catalog_page.fill_city 'City'
      end

      step "User selects state", "GA" do |value|
        check_element_path :xpath, RequestCatalogPage::STATE_TA, RequestCatalogPage::STATE_IL
        request_catalog_page.click_dropdown_arrow_state

        check_element_path :xpath, request_catalog_page.search_state_item(:ta, value), request_catalog_page.search_state_item(:il, value)
        request_catalog_page.select_dropdown_state value
      end

      step "User fills Zip Code" do
        check_element_path :xpath, RequestCatalogPage::ZIP_CODE_TA, RequestCatalogPage::ZIP_CODE_IL
        request_catalog_page.fill_zip_code '48001'
      end

      step "User adds to email list" do
        check_element_path :xpath, RequestCatalogPage::ADD_EMAIL_LIST_TA, RequestCatalogPage::ADD_EMAIL_LIST_IL
        request_catalog_page.click_add_email
      end

      step "User clicks Request a catalog button" do
        check_element_path :xpath, RequestCatalogPage::REQUEST_CATALOG_BTN_TA, RequestCatalogPage::REQUEST_CATALOG_BTN_IL
        request_catalog_page.click_request_catalog
      end

      sleep 3
    end
  end
end
