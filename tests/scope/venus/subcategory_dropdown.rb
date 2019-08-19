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

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        it.click_clothing_category
      end

      step "User opens dropdown in the Clothing category" do
        it.open_category_dropdown
      end

      step "User chooses the Tops subcategory in the dropdown" do
        it.choose_tops_subcategory
      end

      step "User opens dropdown in the Tops subcategory" do
        it.open_subcategory_dropdown
      end

      step "User chooses the Clothing category in the dropdown" do
        it.choose_clothing_category
      end

      sleep 3
    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        # check_element_path :xpath, Venus::CLOTHING_CATEGORY_TA, Venus::CLOTHING_CATEGORY_IL
        it.click_clothing_category
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          # check_element_path :xpath, Venus::CATEGORY_DROPDOWN_TA, Venus::CATEGORY_DROPDOWN_IL
          it.open_category_dropdown
        end

        step "User chooses the Tops subcategory in the dropdown" do
          # check_element_path :xpath, Venus::TOPS_SUBCATEGORY_TA, Venus::TOPS_SUBCATEGORY_IL
          it.choose_tops_subcategory
          sleep 2
        end

        step "User opens dropdown in the Tops subcategory" do
          # check_element_path :xpath, Venus::SUBCATEGORY_DROPDOWN_TA, Venus::SUBCATEGORY_DROPDOWN_IL
          it.open_subcategory_dropdown
        end

        step "User chooses the Clothing category in the dropdown" do
          # check_element_path :xpath, Venus::CLOTHING_CATEGORY_DROPDOWN_TA, Venus::CLOTHING_CATEGORY_DROPDOWN_IL
          it.choose_clothing_category
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Clothing category" do
        check_element_path :xpath, Venus::CLOTHING_CATEGORY_EP, Venus::CLOTHING_CATEGORY_IL
        it.click_clothing_category :ep
      end

      2.times do
        step "User opens dropdown in the Clothing category" do
          check_element_path :xpath, Venus::CATEGORY_DROPDOWN_EP, Venus::CATEGORY_DROPDOWN_IL
          it.open_category_dropdown :ep
        end

        step "User chooses the Tops subcategory in the dropdown" do
          check_element_path :xpath, Venus::TOPS_SUBCATEGORY_EP, Venus::TOPS_SUBCATEGORY_IL
          it.choose_tops_subcategory :ep
          sleep 2
        end

        step "User opens dropdown in the Tops subcategory" do
          check_element_path :xpath, Venus::SUBCATEGORY_DROPDOWN_EP, Venus::SUBCATEGORY_DROPDOWN_IL
          it.open_subcategory_dropdown :ep
        end

        step "User chooses the Clothing category in the dropdown" do
          check_element_path :xpath, Venus::CLOTHING_CATEGORY_DROPDOWN_EP, Venus::CLOTHING_CATEGORY_DROPDOWN_IL
          it.choose_clothing_category :ep
        end
      end

      sleep 3
    end


  end
end
