require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/stage_com'

it = Stagecom.new

# This tests runs when the vpn is ON

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Stagecom - adding item to sart' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        it.click_humburger_menu
      end

      step "User clicks to select category Kids" do
        it.click_category_kids
      end

      step "# User clicks to" do
        it.click_subcategory_baby
      end

      step "# User clicks to" do
        it.click_subcategory_babygirl
      end

      step "# User clicks to" do
        it.click_girl_dress
      end

      step "# User clicks to" do
        it.click_pink_dress
      end

      step "# User clicks to" do
        it.click_baby_size
      end

      step "# User clicks to" do
        it.click_add_to_cart
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path :xpath, Stagecom::HUMBURGER_MENU_TA, Stagecom::HUMBURGER_MENU_IL
        it.click_humburger_menu
      end

      step "User clicks to select category Kids" do
        check_element_path :xpath, Stagecom::CATEGORY_KIDS_TA, Stagecom::CATEGORY_KIDS_IL
        it.click_category_kids
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::SUBCATEGORY_BABY_TA,Stagecom::SUBCATEGORY_BABY_IL
        it.click_subcategory_baby
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::SUBCATEGORY_BABYGIRL_TA, Stagecom::SUBCATEGORY_BABYGIRL_IL
        it.click_subcategory_babygirl
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::GIRL_DRESS_TA, Stagecom::GIRL_DRESS_IL
        it.click_girl_dress
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::PINK_DRESS_TA, Stagecom::PINK_DRESS_IL
        it.click_pink_dress
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::BABY_SIZE_TA, Stagecom::BABY_SIZE_IL
        it.click_baby_size
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::ADD_TO_CART_TA, Stagecom::ADD_TO_CART_IL
        it.click_add_to_cart
      end

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path :xpath, Stagecom::HUMBURGER_MENU_EP, Stagecom::HUMBURGER_MENU_IL
        it.click_humburger_menu :ep
      end

      step "User clicks to select category Kids" do
        check_element_path :xpath, Stagecom::CATEGORY_KIDS_EP, Stagecom::CATEGORY_KIDS_IL
        it.click_category_kids :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::SUBCATEGORY_BABY_EP, Stagecom::SUBCATEGORY_BABY_IL
        it.click_subcategory_baby :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::SUBCATEGORY_BABYGIRL_EP, Stagecom::SUBCATEGORY_BABYGIRL_IL
        it.click_subcategory_babygirl :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::GIRL_DRESS_EP, Stagecom::GIRL_DRESS_IL
        it.click_girl_dress :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::PINK_DRESS_EP, Stagecom::PINK_DRESS_IL
        it.click_pink_dress :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::BABY_SIZE_EP, Stagecom::BABY_SIZE_IL
        it.click_baby_size :ep
      end

      step "# User clicks to" do
        check_element_path :xpath, Stagecom::ADD_TO_CART_EP, Stagecom::ADD_TO_CART_IL
        it.click_add_to_cart :ep
      end
    end

  end
end
