require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = Home_Page.new
designer_page = Designer_Page.new
account_request_page = Account_Request_Page.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Request design account' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Request a Design Account'" do
        home_page.click_companies"Design Concierge"
      end

      step "User signs up" do
        home_page.close_banner
        designer_page.click_sign_up
      end

      step "User selects country" , "CA"  do |value|
        account_request_page.click_dropdown_arrow_country
        account_request_page.select_dropdown_country value
        home_page.close_banner
      end

      step "User selects title" , "ms"  do |value|
        account_request_page.click_dropdown_arrow_title
        account_request_page.select_dropdown_title value
      end

      step "User fills first name", settings('annieselke')['fisrt_name'] do |first_name|
        account_request_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        account_request_page.fill_last_name(last_name)
      end

      step "User fills address line", "address1" do |address|
        account_request_page.fill_address_line(address)
      end

      step "User fills City", "City" do |city|
        account_request_page.fill_city(city)
      end

      step "User selects state", "CA-AB"  do |value|
        account_request_page.click_dropdown_arrow_state
        account_request_page.select_dropdown_state value
      end

      step "User fills post code", "48001" do |code|
        account_request_page.fill_post_code(code)
      end

      step "User selects sales types", "Catalog"  do |value|
        account_request_page.click_dropdown_arrow_sales
        account_request_page.select_dropdown_sales_types value
      end

      step "User fills Company", "Intersog" do |company|
        account_request_page.fill_company(company)
      end

      step "User fills phone number", "12345" do |phone|
        account_request_page.fill_phone(phone)
      end

      step "User fills email address", "12345" do |email|
        account_request_page.fill_email(email)
      end

      step "User fills resale number", "12345" do |phone|
        account_request_page.fill_resale_number(phone)
      end

      step "User clicks Account Request" do
        account_request_page.click_request_account
      end
    end


    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        home_page.close_banner
      end

      step "User clicks 'Request a Design Account'" do
        check_element_path :xpath, home_page.search_categories(:ta, 'Design Concierge'), home_page.search_categories(:il, 'Design Concierge')
        home_page.click_companies"Design Concierge"
      end

      step "User signs up" do
        home_page.close_banner
        check_element_path :xpath, Designer_Page::SIGN_UP_TODAY_TA, Designer_Page::SIGN_UP_TODAY_IL
        designer_page.click_sign_up
      end

      # step "User selects country" , "CA"  do |value|
      #   account_request_page.move_to_tab
      #   check_element_path :xpath, Account_Request_Page::COUNTRY_SELECT_TA, Account_Request_Page::COUNTRY_SELECT_IL
      #   account_request_page.click_dropdown_arrow_country
      #
      #   check_element_path :xpath, Account_Request_Page.search_country_item(:ta, value), Account_Request_Page.search_country_item(:il, value)
      #   account_request_page.select_dropdown_country value
      #   home_page.close_banner
      # end

      step "User selects title" , "ms"  do |value|
        account_request_page.move_to_tab
        check_element_path :xpath, Account_Request_Page::TITLE_SELECT_TA, Account_Request_Page::TITLE_SELECT_IL
        account_request_page.click_dropdown_arrow_title

        check_element_path :xpath, Account_Request_Page.search_title_item(:ta, value), Account_Request_Page.search_title_item(:il, value)
        account_request_page.select_dropdown_title value
      end

      step "User fills first name", settings('annieselke')['fisrt_name'] do |first_name|
        check_element_path :xpath, Account_Request_Page::FIRST_NAME_TA, Account_Request_Page::FIRST_NAME_IL
        account_request_page.fill_first_name(first_name)
      end

      step "User fills last name", settings('annieselke')['last_name'] do |last_name|
        check_element_path :xpath, Account_Request_Page::LAST_NAME_TA, Account_Request_Page::LAST_NAME_IL
        account_request_page.fill_last_name(last_name)
      end

      step "User fills address line", "address1" do |address|
        check_element_path :xpath, Account_Request_Page::ADDRESS_LINE_TA, Account_Request_Page::ADDRESS_LINE_IL
        account_request_page.fill_address_line(address)
      end

      step "User fills City", "City" do |city|
        check_element_path :xpath, Account_Request_Page::CITY_FIELD_TA, Account_Request_Page::CITY_FIELD_IL
        account_request_page.fill_city(city)
      end

      step "User selects state", "CA-AB"  do |value|
        check_element_path :xpath, Account_Request_Page::STATE_REGION_TA, Account_Request_Page::STATE_REGION_IL
        account_request_page.click_dropdown_arrow_state

        check_element_path :xpath, Account_Request_Page.search_state_item(:ta, value), Account_Request_Page.search_state_item(:il, value)
        account_request_page.select_dropdown_state value
      end

      step "User fills post code", "48001" do |code|
        check_element_path :xpath, Account_Request_Page::POST_CODE_TA, Account_Request_Page::POST_CODE_IL
        account_request_page.fill_post_code(code)
      end

      step "User selects sales types", "Catalog"  do |value|
        check_element_path :xpath, Account_Request_Page::TYPE_SALES_TA, Account_Request_Page::TYPE_SALES_IL
        account_request_page.click_dropdown_arrow_sales

        check_element_path :xpath, Account_Request_Page.search_type_sales_item(:ta, value), Account_Request_Page.search_type_sales_item(:il, value)
        account_request_page.select_dropdown_sales_types value
      end

      step "User fills Company", "Intersog" do |company|
        check_element_path :xpath, Account_Request_Page::COMPANY_TA, Account_Request_Page::COMPANY_IL
        account_request_page.fill_company(company)
      end

      step "User fills phone number", "12345" do |phone|
        check_element_path :xpath, Account_Request_Page::PHONE_NUMBER_TA, Account_Request_Page::PHONE_NUMBER_IL
        account_request_page.fill_phone(phone)
      end

      step "User fills email address", "12345" do |email|
        check_element_path :xpath, Account_Request_Page::EMAIL_TA, Account_Request_Page::EMAIL_IL
        account_request_page.fill_email(email)
      end

      step "User fills resale number", "12345" do |phone|
        check_element_path :xpath, Account_Request_Page::PHONE_NUMBER_TA, Account_Request_Page::PHONE_NUMBER_IL
        account_request_page.fill_resale_number(phone)
      end

      step "User clicks Account Request" do
        check_element_path :xpath, Account_Request_Page::ACCOUNT_REQUEST_BTN_TA, Account_Request_Page::ACCOUNT_REQUEST_BTN_IL
        account_request_page.click_request_account
      end

    end
  end
end
