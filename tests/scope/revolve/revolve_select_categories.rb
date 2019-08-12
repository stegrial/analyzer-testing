require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/revolve'

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Select categories and product' do

    scenario 'Recording IL', il_run: true do

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
        it.click_product_item4
      end

    end

    scenario 'Searching IL', il_run: true do

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
    end

    # Element Picker from Repository
    # # # # #  NOT ADDED

    scenario 'Searching EP', ep_run: true do
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
    end
  end
end
