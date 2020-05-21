require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

catalog_page = CatalogPage.new
request_catalog_page = RequestCatalogPage.new
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

  feature 'Request a current catalog' do

    # Initial locators with Recording

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
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
      end
    end
  end
end
