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

  feature 'Checking two dropdowns on the category page and on the subcategory page' do
    # This dropdowns are the same but they are two different elements and are present on the page
    # at the same time.

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        it.click_clothing_cat
      end

      step "User opens dropdown in the Clothing category" do
        it.open_cat_dropdown
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        it.choose_subcat_by_first_name name
      end

      step "User opens dropdown in the Tops subcategory" do
        it.open_subcat_dropdown
      end

      step "User chooses the Clothing category in the dropdown" do
        it.choose_clothing_cat
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        check_element_path :xpath, Venus::CLOTHING_CAT_TA, Venus::CLOTHING_CAT_IL
        it.click_clothing_cat
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          sleep 5
          check_element_path :xpath, Venus::CAT_DROPDOWN_TA, Venus::CAT_DROPDOWN_IL
          it.open_cat_dropdown
        end

        step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
          check_element_path :xpath, it.subcat_name(:ta, name), it.subcat_name(:il, name)
          it.choose_subcat_by_first_name name
        end

        step "User opens dropdown in the Tops subcategory" do
          check_element_path :xpath, Venus::SUBCAT_DROPDOWN_TA, Venus::SUBCAT_DROPDOWN_IL
          it.open_subcat_dropdown
        end

        step "User chooses the Clothing category in the dropdown" do
          check_element_path :xpath, Venus::CLOTHING_CAT_DROPDOWN_TA, Venus::CLOTHING_CAT_DROPDOWN_IL
          it.choose_clothing_cat
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        check_element_path :xpath, Venus::CLOTHING_CAT_EP, Venus::CLOTHING_CAT_IL
        it.click_clothing_cat :ep
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          check_element_path :xpath, Venus::CAT_DROPDOWN_EP, Venus::CAT_DROPDOWN_IL
          it.open_cat_dropdown :ep
        end

        step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
          check_element_path :xpath, it.subcat_name(:ep, name), it.subcat_name(:il, name)
          it.choose_subcat_by_first_name :ep, name
        end

        step "User opens dropdown in the Tops subcategory" do
          check_element_path :xpath, Venus::SUBCAT_DROPDOWN_EP, Venus::SUBCAT_DROPDOWN_IL
          it.open_subcat_dropdown :ep
        end

        step "User chooses the Clothing category in the dropdown" do
          check_element_path :xpath, Venus::CLOTHING_CAT_DROPDOWN_EP, Venus::CLOTHING_CAT_DROPDOWN_IL
          it.choose_clothing_cat :ep
        end
      end

      sleep 3
    end


  end
end
