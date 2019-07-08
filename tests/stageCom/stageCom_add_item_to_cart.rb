require 'spec_helper'
require_relative '../../pages/united_methods'
require_relative '../../pages/stage_com.rb'
require_relative '../../helpers/special_methods'


include PathCheck
include StageCom
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature '' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        click_humburger_menu
      end

      step "User clicks to select category Kids" do
        click_category_kids
      end

      step "# User clicks to" do
        click_subcategory_baby
      end

      step "# User clicks to" do
        click_subcategory_babygirl
      end

      step "# User clicks to" do
        click_girl_dress
      end

      step "# User clicks to" do
        click_pink_dress
      end

      step "# User clicks to" do
        click_baby_size
      end

      step "# User clicks to" do
        click_add_to_cart
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path @humburger_menu_ta, @humburger_menu_il
        click_humburger_menu
      end

      step "User clicks to select category Kids" do
        check_element_path @category_kids_ta, @category_kids_il
        click_category_kids
      end

      step "# User clicks to" do
        check_element_path @subcategory_baby_ta, @subcategory_baby_il
        click_subcategory_baby
      end

      step "# User clicks to" do
        check_element_path @subcategory_babygirl_ta, @subcategory_babygirl_il
        click_subcategory_babygirl
      end

      step "# User clicks to" do
        check_element_path @girl_dress_ta, @girl_dress_il
        click_girl_dress
      end

      step "# User clicks to" do
        check_element_path @pink_dress_ta, @pink_dress_il
        click_pink_dress
      end

      step "# User clicks to" do
        check_element_path @baby_size_ta, @baby_size_il
        click_baby_size
      end

      step "# User clicks to" do
        check_element_path @add_to_cart_ta, @add_to_cart_il
        click_add_to_cart
      end

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path @humburger_menu_ep, @humburger_menu_il
        click_humburger_menu :ep
      end

      step "User clicks on signin link" do
        check_element_path @signin_link_ep, @signin_link_il
        click_signin_link :ep
      end
      close_modal

      step "User set  account email" , settings('stageCom')['email'] do |email|
        check_element_path @account_email_ep, @account_email_il
        click_account_email email, :ep
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
        check_element_path @pass_ep, @pass_il
        click_pass password, :ep
      end

      step "User clicks on signin btn" do
        check_element_path @signin_btn_ep, @signin_btn_il
        click_signin_btn :ep
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        check_element_path @logo_ep, @logo_il
        click_logo :ep
      end
      step "User clicks on minicart" do
        check_element_path @minicart_ep, @minicart_il
        click_minicart :ep
      end
      sleep 5

    end

  end
end
