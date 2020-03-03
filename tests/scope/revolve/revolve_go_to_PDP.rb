require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/revolve'

include ElementSearchValidation

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Select categories and product' do

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        it.click_categories_in_top_navmenu
      end

      step "User clicks on dresses categories button" do
       sleep 3
        it.click_dresses_categories
      end

      step "User clicks on product item 4" do
        sleep 3
        it.click_product_item4
      end

      step "User clicks on size item" do
        sleep 3
        it.click_to_select_size
      end

      step "User clicks on buy btn" do
        it.click_add_to_bag
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::CATEGORIES_NAVMENU_TA, Revolve::CATEGORIES_NAVMENU_IL
        it.click_categories_in_top_navmenu
      end

      step "User clicks on dresses categories button" do
        check_element_path :xpath, Revolve::DRESSES_CATEGORY_TA, Revolve::DRESSES_CATEGORY_IL
        it.click_dresses_categories
      end

      step "User clicks on product item 4" do
        check_element_path :xpath, Revolve::PRODUCT_ITEM_TA, Revolve::PRODUCT_ITEM_IL
        it.click_product_item4
      end

      step "User clicks on size item" do
        check_element_path :xpath, Revolve::SIZE_BUTTON_S_TA, Revolve::SIZE_BUTTON_S_IL
        it.click_to_select_size
      end

      step "User clicks on buy btn" do
        check_element_path :xpath, Revolve::ADD_TO_BAG_TA, Revolve::ADD_TO_BAG_IL
        it.click_add_to_bag
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::CATEGORIES_NAVMENU_EP, Revolve::CATEGORIES_NAVMENU_IL
        it.click_categories_in_top_navmenu :ep
      end

      step "User clicks on dresses categories button" do
        check_element_path :xpath, Revolve::DRESSES_CATEGORY_EP, Revolve::DRESSES_CATEGORY_IL
        it.click_dresses_categories :ep
      end

      step "User clicks on product item 4" do
        check_element_path :xpath, Revolve::PRODUCT_ITEM_EP, Revolve::PRODUCT_ITEM_IL
        it.click_product_item4 :ep
      end

      step "User clicks on size item" do
        check_element_path :xpath, Revolve::SIZE_BUTTON_S_EP, Revolve::SIZE_BUTTON_S_IL
        it.click_to_select_size :ep
      end

      step "User clicks on buy btn" do
        check_element_path :xpath, Revolve::REVOLVE_LOGO_EP, Revolve::REVOLVE_LOGO_IL
        it.click_add_to_bag :ep
      end
    end
  end
end
