require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/venus_pages/*.rb"

sub_category_page = VenusSubCategory.new
navigation_page = VenusNavigation.new
category_page = VenusCategory.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'Size filter dropdown menu' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", 'https://www.venus.com/products.aspx?BRANCH=7~63~' do |url|
        page.visit url
      end

      step "User opens the Size filter" do
        sub_category_page.open_size_filter
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        sub_category_page.choose_filter_size size
      end

      step "User clicks on the View Results button" do
        sub_category_page.click_view_results_btn
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        navigation_page.click_clothing_cat :il
      end

      step "User opens dropdown in the Clothing category" do
        category_page.open_cat_dropdown :il
        sleep 2
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name :il, name
      end

      step "User opens the Size filter" do
        check_element_path :xpath, VenusSubCategory::SIZE_FILTER_TA, VenusSubCategory::SIZE_FILTER_IL
        sub_category_page.open_size_filter
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        check_element_path :xpath, sub_category_page.filter_size(:ta, size), sub_category_page.filter_size(:il, size)
        sub_category_page.choose_filter_size size
      end

      step "User clicks on the View Results button" do
        check_element_path :xpath, VenusSubCategory::VIEW_RESULTS_BTN_TA, VenusSubCategory::VIEW_RESULTS_BTN_IL
        sub_category_page.click_view_results_btn
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        navigation_page.click_clothing_cat :il
      end

      step "User opens dropdown in the Clothing category" do
        category_page.open_cat_dropdown :il
        sleep 2
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name :il, name
      end

      step "User opens the Size filter" do
        check_element_path :xpath, VenusSubCategory::SIZE_FILTER_EP, VenusSubCategory::SIZE_FILTER_IL
        sub_category_page.open_size_filter :ep
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        check_element_path :xpath, sub_category_page.filter_size(:ep, size), sub_category_page.filter_size(:il, size)
        sub_category_page.choose_filter_size :ep, size
      end

      step "User clicks on the View Results button" do
        check_element_path :xpath, VenusSubCategory::VIEW_RESULTS_BTN_EP, VenusSubCategory::VIEW_RESULTS_BTN_IL
        sub_category_page.click_view_results_btn :ep
      end

      sleep 3
    end


  end
end
