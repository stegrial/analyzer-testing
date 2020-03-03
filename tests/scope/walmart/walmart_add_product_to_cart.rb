require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/walmart'

include ElementSearchValidation

it = Walmart.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Walmart - add product to cart ' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('walmart')['page'] do |url|
        page.visit url
      end

      step "User clicks to open humburger menu" do
        it.click_humburger_menu
      end

      step "User clicks select baby category" do
        it.click_baby_category
      end

      step "User clicks to feeding subcategore" do
        it.click_feeding
      end

      step "User clicks to select baby food" do
        it.click_baby_food
      end

      step "User clicks to select purees category" do
        it.click_purees
      end

      step "User clicks to select product" do
        it.click_to_select_product
      end

      step "User clicks to add to registry " do
        it.click_for_add_to_registry
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('walmart')['page'] do |url|
        page.visit url
      end

      step "User clicks to open humburger menu" do
        check_element_path :xpath, Walmart::HUMBURGER_BTN_TA, Walmart::HUMBURGER_BTN_IL
        it.click_humburger_menu
      end

      step "User clicks select baby category" do
        check_element_path :xpath, Walmart::BABY_CATEGORY_TA, Walmart::BABY_CATEGORY_IL
        it.click_baby_category
      end

      step "User clicks to feeding subcategore" do
        check_element_path :xpath, Walmart::FEEDING_TA, Walmart::FEEDING_IL
        it.click_feeding
      end

      step "User clicks to select baby food" do
        check_element_path :xpath, Walmart::BABY_FOOD_TA, Walmart::BABY_FOOD_IL
        it.click_baby_food
      end

      step "User clicks to select purees category" do
        check_element_path :xpath, Walmart::PUREES_FOOD_TA, Walmart::PUREES_FOOD_IL
        it.click_purees
      end

      step "User clicks to select product" do
        check_element_path :xpath, Walmart::PRODUCT_TA, Walmart::PRODUCT_IL
        it.click_to_select_product
      end

      step "User clicks to add to registry " do
        check_element_path :css, Walmart::ADD_TO_REGISTRY_TA, Walmart::ADD_TO_REGISTRY_IL
        it.click_for_add_to_registry
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('walmart')['page'] do |url|
        page.visit url
      end

      step "User clicks to open humburger menu" do
        check_element_path :xpath, Walmart::HUMBURGER_BTN_EP, Walmart::HUMBURGER_BTN_IL
        it.click_humburger_menu :ep
      end

      step "User clicks select baby category" do
        check_element_path :xpath, Walmart::BABY_CATEGORY_EP, Walmart::BABY_CATEGORY_IL
        it.click_baby_category  :ep
      end

      step "User clicks to feeding subcategore" do
        check_element_path :xpath, Walmart::FEEDING_EP, Walmart::FEEDING_IL
        it.click_feeding :ep
      end

      step "User clicks to select baby food" do
        check_element_path :xpath, Walmart::BABY_FOOD_EP, Walmart::BABY_FOOD_IL
        it.click_baby_food :ep
      end

      step "User clicks to select purees category" do
        check_element_path :xpath, Walmart::PUREES_FOOD_EP, Walmart::PUREES_FOOD_IL
        it.click_purees :ep
      end

      step "User clicks to select product" do
        check_element_path :xpath, Walmart::PRODUCT_EP, Walmart::PRODUCT_IL
        it.click_to_select_product :ep
      end

      step "User clicks to add to registry " do
        check_element_path :css, Walmart::ADD_TO_REGISTRY_EP, Walmart::ADD_TO_REGISTRY_IL
        it.click_for_add_to_registry :ep
      end
    end
  end
end
