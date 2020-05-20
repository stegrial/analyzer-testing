require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

designer_page = DesignerPage.new
account_request_page = AccountRequestPage.new
banner_page = BannerPage.new
footer_page = FooterPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Request design account' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks 'Request a Design Account'" do
          banner_page.close_banner
          footer_page.click_companies "Design Concierge"
        end

        step "User signs up" do
          banner_page.close_banner
          designer_page.click_sign_up
        end

        step "User selects country", "CA" do |value|
          account_request_page.click_dropdown_arrow_country
          account_request_page.select_dropdown_country value
          banner_page.close_banner
        end

        step "User selects title", "ms" do |value|
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

        step "User selects state", "CA-AB" do |value|
          account_request_page.click_dropdown_arrow_state
          account_request_page.select_dropdown_state value
        end

        step "User fills post code", "48001" do |code|
          account_request_page.fill_post_code(code)
        end

        step "User selects sales types", "Catalog" do |value|
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

        sleep 3
      end
    end
  end
end
