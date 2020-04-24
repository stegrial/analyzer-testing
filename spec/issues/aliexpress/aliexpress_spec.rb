
require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/aliexpress/*.rb"

include ElementSearchValidation

aliexpress_page = AliexpressPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Main Page testing' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('aliexpress')['main_page'] do |url|
        page.visit url
      end

      step 'User clicks X for close modal' do
        aliexpress_page.click_x_to_close_modal
      end

      step "User click phone link in left sidebar" do
        aliexpress_page.click_phone_link_sidebar
      end

      step "User click electronics link in left sidebar" do
        aliexpress_page.click_electronics_link_sidebar
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('aliexpress')['main_page'] do |url|
        page.visit url
      end

      step 'User clicks X for close modal' do
        check_element_path :xpath, AliexpressPage::CLOSE_MODAL_TA, AliexpressPage::CLOSE_MODAL_IL
        aliexpress_page.click_x_to_close_modal
      end

      step "User click the next slider button" do
        check_element_path :xpath, AliexpressPage::PHONES_LINK_TA, AliexpressPage::PHONES_LINK_IL
        aliexpress_page.click_phone_link_sidebar
      end

      step "User click the next slider button" do
        check_element_path :xpath, AliexpressPage::ELECTRONICS_LINK_TA, AliexpressPage::ELECTRONICS_LINK_IL
        aliexpress_page.click_electronics_link_sidebar
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('aliexpress')['main_page'] do |url|
        page.visit url
      end

      step 'User clicks X for close modal' do
        check_element_path :xpath, AliexpressPage::CLOSE_MODAL_EP, AliexpressPage::CLOSE_MODAL_IL
        aliexpress_page.click_x_to_close_modal
      end

      step "User click the next slider button" do
        check_element_path :xpath, AliexpressPage::PHONES_LINK_EP, AliexpressPage::PHONES_LINK_IL
        aliexpress_page.click_phone_link_sidebar
      end

      step "User click the next slider button" do
        check_element_path :xpath, AliexpressPage::ELECTRONICS_LINK_EP, AliexpressPage::ELECTRONICS_LINK_IL
        aliexpress_page.click_electronics_link_sidebar
      end

    end
  end
end

