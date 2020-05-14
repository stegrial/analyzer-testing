require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

product_page = TheTiebarProductPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Sorting product page' do

    # Initial locators with Recording

    scenario 'Recording IL', il1: true do
      step "User goes to the page", settings('thetiebar')['skinnyties_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        product_page.click_sort_by
      end

      step "User clicks to select black color filter" do
        product_page.click_newest_soring
      end

      step "User clicks to select blue color filter" do
        product_page.click_view
      end

      step "User clicks to select black color filter" do
        product_page.click_view72
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['skinnyties_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::SORT_BY_FILTER_TA, TheTiebarProductPage::SORT_BY_FILTER_IL
        product_page.click_sort_by
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::NEWEST_TA, TheTiebarProductPage::NEWEST_IL
        product_page.click_newest_soring
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::VIEW_TA, TheTiebarProductPage::VIEW_IL
        product_page.click_view
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::VIEW_72_TA, TheTiebarProductPage::VIEW_72_IL
        product_page.click_view72
      end

      sleep 3
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['skinnyties_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::SORT_BY_FILTER_EP, TheTiebarProductPage::SORT_BY_FILTER_IL
        product_page.click_sort_by :ep
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::NEWEST_EP, TheTiebarProductPage::NEWEST_IL
        product_page.click_newest_soring :ep
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::VIEW_EP, TheTiebarProductPage::VIEW_IL
        product_page.click_view :ep
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::VIEW_72_EP, TheTiebarProductPage::VIEW_72_IL
        product_page.click_view72 :ep
      end
    end
  end
end