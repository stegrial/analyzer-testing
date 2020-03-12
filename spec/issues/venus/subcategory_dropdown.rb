require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

sub_category_page = VenusSubCategory.new
navigation_page = VenusNavigation.new
category_page = VenusCategory.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
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
        navigation_page.click_clothing_cat
      end

      step "User opens dropdown in the Clothing category" do
        category_page.open_cat_dropdown
      end

      step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
        category_page.choose_subcat_by_first_name name
      end

      step "User opens dropdown in the Tops subcategory" do
        sub_category_page.open_subcat_dropdown
      end

      step "User chooses the Clothing category in the dropdown" do
        sub_category_page.choose_clothing_cat
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        check_element_path :xpath, VenusNavigation::CLOTHING_CAT_TA, VenusNavigation::CLOTHING_CAT_IL
        navigation_page.click_clothing_cat
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          sleep 5
          check_element_path :xpath, VenusCategory::CAT_DROPDOWN_TA, VenusCategory::CAT_DROPDOWN_IL
          category_page.open_cat_dropdown
        end

        step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
          check_element_path :xpath, category_page.subcat_name(:ta, name), category_page.subcat_name(:il, name)
          category_page.choose_subcat_by_first_name name
        end

        step "User opens dropdown in the Tops subcategory" do
          check_element_path :xpath, VenusSubCategory::SUBCAT_DROPDOWN_TA, VenusSubCategory::SUBCAT_DROPDOWN_IL
          sub_category_page.open_subcat_dropdown
        end

        step "User chooses the Clothing category in the dropdown" do
          check_element_path :xpath, VenusSubCategory::CLOTHING_CAT_DROPDOWN_TA, VenusSubCategory::CLOTHING_CAT_DROPDOWN_IL
          sub_category_page.choose_clothing_cat
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
        check_element_path :xpath, VenusNavigation::CLOTHING_CAT_EP, VenusNavigation::CLOTHING_CAT_IL
        navigation_page.click_clothing_cat :ep
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          check_element_path :xpath, VenusCategory::CAT_DROPDOWN_EP, VenusCategory::CAT_DROPDOWN_IL
          category_page.open_cat_dropdown :ep
        end

        step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
          check_element_path :xpath, category_page.subcat_name(:ep, name), category_page.subcat_name(:il, name)
          category_page.choose_subcat_by_first_name :ep, name
        end

        step "User opens dropdown in the Tops subcategory" do
          check_element_path :xpath, VenusCategory::SUBCAT_DROPDOWN_EP, VenusCategory::SUBCAT_DROPDOWN_IL
          sub_category_page.open_subcat_dropdown :ep
        end

        step "User chooses the Clothing category in the dropdown" do
          check_element_path :xpath, VenusSubCategory::CLOTHING_CAT_DROPDOWN_EP, VenusSubCategory::CLOTHING_CAT_DROPDOWN_IL
          sub_category_page.choose_clothing_cat :ep
        end
      end

      sleep 3
    end

    scenario 'Recording debug', record_debug: true do
      # step "User goes to the page", settings('venus')['home_page'] do |url|
    step "User goes to the page", settings('venus')['clothing_page'] do |url|
        page.visit url
      end
      #
      #
      # step "User clicks on the Clothing category" do
      #   navigation_page.click_clothing_cat :il
      # end
      #
      # step "User opens dropdown in the Clothing category" do
      #   category_page.open_cat_dropdown :il
      # end

      # step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
      #   category_page.choose_subcat_by_first_name :il,name
      # end

      step "User opens dropdown in the Tops subcategory" do
        sub_category_page.open_subcat_dropdown :il
      end

      step "User chooses the Clothing category in the dropdown" do
        sub_category_page.choose_clothing_cat
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        navigation_page.click_clothing_cat :il
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          sleep 5
          category_page.open_cat_dropdown :il
        end

        step "User chooses the subcategory in the dropdown", 'Clothing', 'Tops' do |*name|
          category_page.choose_subcat_by_first_name :il,name
        end

        step "User opens dropdown in the Tops subcategory" do
          sub_category_page.open_subcat_dropdown :il
        end

        step "User chooses the Clothing category in the dropdown" do
          sub_category_page.choose_clothing_cat
        end
      end
    end
  end
end
