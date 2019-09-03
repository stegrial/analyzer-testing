require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Size filter dropdown menu' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['pro_tops_subcategory_page'] do |url|
        page.visit url
      end

      step "User opens the Size filter" do
        it.open_size_filter
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        it.choose_filter_size size
      end

      step "User clicks on the View Results button" do
        it.click_view_results_btn
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        it.click_clothing_cat :il
      end

      step "User opens dropdown in the Clothing category" do
        it.open_cat_dropdown :il
        sleep 2
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        it.choose_subcat_by_first_name :il, name
      end

      step "User opens the Size filter" do
        check_element_path :xpath, Venus::SIZE_FILTER_TA, Venus::SIZE_FILTER_IL
        it.open_size_filter
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        check_element_path :xpath, it.filter_size(:ta, size), it.filter_size(:il, size)
        it.choose_filter_size size
      end

      step "User clicks on the View Results button" do
        check_element_path :xpath, Venus::VIEW_RESULTS_BTN_TA, Venus::VIEW_RESULTS_BTN_IL
        it.click_view_results_btn
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        it.click_clothing_cat :il
      end

      step "User opens dropdown in the Clothing category" do
        it.open_cat_dropdown :il
        sleep 2
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        it.choose_subcat_by_first_name :il, name
      end

      step "User opens the Size filter" do
        check_element_path :xpath, Venus::SIZE_FILTER_EP, Venus::SIZE_FILTER_IL
        it.open_size_filter :ep
      end

      step "User chooses a size in the filter", 'S (4-6)' do |size|
        check_element_path :xpath, it.filter_size(:ep, size), it.filter_size(:il, size)
        it.choose_filter_size :ep, size
      end

      step "User clicks on the View Results button" do
        check_element_path :xpath, Venus::VIEW_RESULTS_BTN_EP, Venus::VIEW_RESULTS_BTN_IL
        it.click_view_results_btn :ep
      end

      sleep 3
    end


  end
end
