require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

product_page = TheTiebarProductPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Filtering product page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['pants_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        product_page.click_to_select_color_blue
      end

      step "User clicks to select black color filter" do
        product_page.click_to_select_color_black
      end

      step "User click to select slim fit" do
        product_page.click_slim_fit
      end

      step "User click to select wool material" do
        product_page.click_wool_material
      end

      step "User click to select 28 waist" do
        product_page.click_28_waist
      end
      sleep 3


    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['pants_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::BLUE_COLOR_TA, TheTiebarProductPage::BLUE_COLOR_IL
        product_page.click_to_select_color_blue
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::BLACK_COLOR_TA, TheTiebarProductPage::BLACK_COLOR_IL
        product_page.click_to_select_color_black
      end

      step "User click to select slim fit" do
        check_element_path :xpath, TheTiebarProductPage::SLIM_FIT_TA, TheTiebarProductPage::SLIM_FIT_IL
        product_page.click_slim_fit
      end

      step "User click to select wool material" do
        check_element_path :xpath, TheTiebarProductPage::WOOL_MATERIAL_TA, TheTiebarProductPage::WOOL_MATERIAL_IL
        product_page.click_wool_material
      end

      step "User click to select 28 waist" do
        check_element_path :xpath, TheTiebarProductPage::WAIST_28_TA, TheTiebarProductPage::WAIST_28_IL
        product_page.click_28_waist
      end
      sleep 3

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['pants_page'] do |url|
        page.visit url
      end

      step "User clicks to select blue color filter" do
        check_element_path :xpath, TheTiebarProductPage::BLUE_COLOR_EP, TheTiebarProductPage::BLUE_COLOR_IL
        product_page.click_to_select_color_blue :ep
      end

      step "User clicks to select black color filter" do
        check_element_path :xpath, TheTiebarProductPage::BLACK_COLOR_EP, TheTiebarProductPage::BLACK_COLOR_IL
        product_page.click_to_select_color_black :ep
      end

      step "User click to select slim fit" do
        check_element_path :xpath, TheTiebarProductPage::SLIM_FIT_EP, TheTiebarProductPage::SLIM_FIT_IL
        product_page.click_slim_fit :ep
      end

      step "User click to select wool material" do
        check_element_path :xpath, TheTiebarProductPage::WOOL_MATERIAL_EP, TheTiebarProductPage::WOOL_MATERIAL_IL
        product_page.click_wool_material :ep
      end

      step "User click to select 28 waist" do
        check_element_path :xpath, TheTiebarProductPage::WAIST_28_EP, TheTiebarProductPage::WAIST_28_IL
        product_page.click_28_waist :ep
      end
      sleep 3


    end
  end
end