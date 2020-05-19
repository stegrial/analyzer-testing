require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

custom_page = TheTiebarCusromPage.new
about_us_page = TheTiebarAboutUs.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Footer: CUSTOM TIES AND ACCESSORIES' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['custom_page'] do |url|
        page.visit url
      end

      step "User click the close cookies div" do
        about_us_page.click_close_coolies_div
      end

      step "User fill first name in field", "test_name" do |first_name|
        custom_page.fill_first_name_field first_name
      end

      step "User fill last name in field", "last_test_name" do |last_name|
        custom_page.fill_last_name_field last_name
      end

      step "User fill email  in field", "email.test@gmail.com" do |email|
        custom_page.fill_email_field email
      end

      step "User fill address  in field", "address" do |address|
        custom_page.fill_address_field address
      end

      step "User fill city in field", "test_city" do |city|
        custom_page.fill_city_field city
      end

      step "User fill state in field", "Arkansas" do |state|
        custom_page.fill_state_field state
      end

      step "User fill zip code in field", "01011" do |zipcode|
        custom_page.fill_zip_code_field zipcode
      end

      step "User fill phone number in field", "+78940503434" do |number|
        custom_page.fill_phone_number_field number
      end

      step "User select bow ties radio button" do
        custom_page.select_bow_ties_1_radiobtn
      end

      step "User select scarves radio button" do
        custom_page.select_scarves_2_radiobtn
      end

      step "User select ties radio button" do
        custom_page.select_ties_3_radiobtn
      end

      step "User click submit button" do
        #sleep 3
        custom_page.click_submit_btn
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['custom_page'] do |url|
        page.visit url
      end

      step "User click the close cookies div" do
        check_element_path :xpath, TheTiebarAboutUs::COOKIES_CLOSE_DIV_TA, TheTiebarAboutUs::COOKIES_CLOSE_DIV_IL
        about_us_page.click_close_coolies_div
      end

      step "User fill first name in field", "test_name" do |first_name|
        check_element_path :xpath, TheTiebarCusromPage::FIRST_NAME_TA, TheTiebarCusromPage::FIRST_NAME_IL
        custom_page.fill_first_name_field first_name
      end

      step "User fill last name in field", "last_test_name" do |last_name|
        check_element_path :xpath, TheTiebarCusromPage::LAST_NAME_TA, TheTiebarCusromPage::LAST_NAME_IL
        custom_page.fill_last_name_field last_name
      end

      step "User fill email  in field", "email.test@gmail.com" do |email|
        check_element_path :xpath, TheTiebarCusromPage::EMAIL_TA, TheTiebarCusromPage::EMAIL_IL
        custom_page.fill_email_field email
      end

      step "User fill address  in field", "address" do |address|
        check_element_path :xpath, TheTiebarCusromPage::ADDRESS_TA, TheTiebarCusromPage::ADDRESS_IL
        custom_page.fill_address_field address
      end

      step "User fill city in field", "test_city" do |city|
        check_element_path :xpath, TheTiebarCusromPage::CITY_TA, TheTiebarCusromPage::CITY_IL
        custom_page.fill_city_field city
      end

      step "User fill state in field", "Arkansas" do |state|
        check_element_path :xpath, TheTiebarCusromPage::STATE_TA, TheTiebarCusromPage::STATE_IL
        custom_page.fill_state_field state
      end

      step "User fill zip code in field", "01011" do |zipcode|
        check_element_path :xpath, TheTiebarCusromPage::ZIP_CODE_TA, TheTiebarCusromPage::ZIP_CODE_IL
        custom_page.fill_zip_code_field zipcode
      end

      step "User fill phone number in field", "+78940503434" do |number|
        check_element_path :xpath, TheTiebarCusromPage::PHONE_NUMBER_TA, TheTiebarCusromPage::PHONE_NUMBER_IL
        custom_page.fill_phone_number_field number
      end

      step "User select bow ties radio button" do
        check_element_path :xpath, TheTiebarCusromPage::BOW_TIES_1_TA, TheTiebarCusromPage::BOW_TIES_1_IL
        custom_page.select_bow_ties_1_radiobtn
      end

      step "User select scarves radio button" do
        check_element_path :xpath, TheTiebarCusromPage::SCARVES_2_TA, TheTiebarCusromPage::SCARVES_2_IL
        custom_page.select_scarves_2_radiobtn
      end

      step "User select ties radio button" do
        check_element_path :xpath, TheTiebarCusromPage::TIES_3_TA, TheTiebarCusromPage::TIES_3_IL
        custom_page.select_ties_3_radiobtn
      end

      step "User click submit button" do
        check_element_path :xpath, TheTiebarCusromPage::SUBMIT_TA, TheTiebarCusromPage::SUBMIT_IL
        custom_page.click_submit_btn
      end

      sleep 3
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['custom_page'] do |url|
        page.visit url
      end

      step "User fill first name in field", "test_name" do |first_name|
        check_element_path :xpath, TheTiebarCusromPage::FIRST_NAME_EP, TheTiebarCusromPage::FIRST_NAME_IL
        custom_page.fill_first_name_field :ep, first_name
      end

      step "User fill last name in field", "last_test_name" do |last_name|
        check_element_path :xpath, TheTiebarCusromPage::LAST_NAME_EP, TheTiebarCusromPage::LAST_NAME_IL
        custom_page.fill_last_name_field :ep, last_name
      end

      step "User fill email  in field", "email.test@gmail.com" do |email|
        check_element_path :xpath, TheTiebarCusromPage::EMAIL_EP, TheTiebarCusromPage::EMAIL_IL
        custom_page.fill_email_field :ep, email
      end

      step "User fill address  in field", "address" do |address|
        check_element_path :xpath, TheTiebarCusromPage::ADDRESS_EP, TheTiebarCusromPage::ADDRESS_IL
        custom_page.fill_address_field :ep, address
      end

      step "User fill city in field", "test_city" do |city|
        check_element_path :xpath, TheTiebarCusromPage::CITY_EP, TheTiebarCusromPage::CITY_IL
        custom_page.fill_city_field :ep, city
      end

      step "User fill state in field", "Arkansas" do |state|
        check_element_path :xpath, TheTiebarCusromPage::STATE_EP, TheTiebarCusromPage::STATE_IL
        custom_page.fill_state_field :ep, state
      end

      step "User fill zip code in field", "01011" do |zipcode|
        check_element_path :xpath, TheTiebarCusromPage::ZIP_CODE_EP, TheTiebarCusromPage::ZIP_CODE_IL
        custom_page.fill_zip_code_field :ep, zipcode
      end

      step "User fill phone number in field", "+78940503434" do |number|
        check_element_path :xpath, TheTiebarCusromPage::PHONE_NUMBER_EP, TheTiebarCusromPage::PHONE_NUMBER_IL
        custom_page.fill_phone_number_field :ep, number
      end

      step "User select bow ties radio button" do
        check_element_path :xpath, TheTiebarCusromPage::BOW_TIES_1_EP, TheTiebarCusromPage::BOW_TIES_1_IL
        custom_page.select_bow_ties_1_radiobtn :ep
      end

      step "User select scarves radio button" do
        check_element_path :xpath, TheTiebarCusromPage::SCARVES_2_EP, TheTiebarCusromPage::SCARVES_2_IL
        custom_page.select_scarves_2_radiobtn :ep
      end

      step "User select ties radio button" do
        check_element_path :xpath, TheTiebarCusromPage::TIES_3_EP, TheTiebarCusromPage::TIES_3_IL
        custom_page.select_ties_3_radiobtn :ep
      end

      step "User click submit button" do
        check_element_path :xpath, TheTiebarCusromPage::SUBMIT_EP, TheTiebarCusromPage::SUBMIT_IL
        custom_page.click_submit_btn :ep
      end
    end
  end
end