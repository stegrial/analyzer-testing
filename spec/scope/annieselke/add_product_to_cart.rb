require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
header_page = HeaderPage.new
product_page = ProductPage.new
banner_page = BannerPage.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Navigation and adding product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "Set mirrors in search field", "mirror\n" do |value|
        header_page.fill_search_input(value)
      end

      step "Click 'Tia Mirror' on product page" do
        product_page.click_tia_mirror_link
      end

      step "User clicks size dropdown arrow", "/D%C3%A9cor-%26-Pillows/Tia-Mirror/p/ASH8714-ACS" do |value|
        product_page.click_dropdown_arrow
        product_page.select_dropdown value
        banner_page.close_banner
      end

      step "User clicks gallery img to change view" do
        product_page.click_to_change_gallery_img
      end

      step "User clicks on Social networks icons" do
        product_page.click_on_facebook_icon

        move_between_tabs
        product_page.click_on_twitter_icon

        move_between_tabs
        product_page.click_on_pinterest_icon

        move_between_tabs
        product_page.click_on_houzz_icon
        move_between_tabs
      end

      step "User clicks additional details" do
        product_page.click_on_additional_details
      end

      step "User fill quantity", "2" do |value|
        product_page.fill_qty(value)
      end

      step "User clicks Add to cart" do
        product_page.click_add_to_cart
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "Set mirrors in search field", "mirror\n" do |value|
        check_element_path :xpath, HeaderPage::SEARCH_FIELD_TA, HeaderPage::SEARCH_FIELD_IL
        header_page.fill_search_input(value)
      end

      step "Click 'Tia Mirror' on product page" do
        check_element_path :xpath, ProductPage::TIA_MIRROR_LINK_TA, ProductPage::TIA_MIRROR_LINK_IL
        product_page.click_tia_mirror_link
      end

      step "User clicks size dropdown arrow", "/D%C3%A9cor-%26-Pillows/Tia-Mirror/p/ASH8714-ACS" do |value|
        check_element_path :xpath, ProductPage::DROPDOWN_ARROW_TA, ProductPage::DROPDOWN_ARROW_IL
        product_page.click_dropdown_arrow

        check_element_path :xpath, ProductPage.search_item(:ta, value), ProductPage.search_item(:il, value)
        product_page.select_dropdown value
        banner_page.close_banner
      end

      step "User clicks gallery img to change view" do
        check_element_path :xpath, ProductPage::GALLERY_IMG_TA, ProductPage::GALLERY_IMG_IL
        product_page.click_to_change_gallery_img
      end

      step "User clicks on Social networks icons" do
        check_element_path :xpath, ProductPage::SOCIAL_NETWORKS_TA[:facebook], ProductPage::SOCIAL_NETWORKS_IL[:facebook]
        product_page.click_on_facebook_icon

        move_between_tabs
        check_element_path :xpath, ProductPage::SOCIAL_NETWORKS_TA[:twitter], ProductPage::SOCIAL_NETWORKS_IL[:twitter]
        product_page.click_on_twitter_icon

        move_between_tabs
        check_element_path :xpath, ProductPage::SOCIAL_NETWORKS_TA[:pinterest], ProductPage::SOCIAL_NETWORKS_IL[:pinterest]
        product_page.click_on_pinterest_icon

        move_between_tabs
        check_element_path :xpath, ProductPage::SOCIAL_NETWORKS_TA[:houzz], ProductPage::SOCIAL_NETWORKS_IL[:houzz]
        product_page.click_on_houzz_icon
        move_between_tabs
      end

      step "User clicks additional details" do
        check_element_path :xpath, ProductPage::ADDITIONAL_DETAILS_TA, ProductPage::ADDITIONAL_DETAILS_IL
        product_page.click_on_additional_details
      end

      step "User fill quantity", "2" do |value|
        check_element_path :xpath, ProductPage::QUANTITY_TA, ProductPage::QUANTITY_IL
        product_page.fill_qty(value)
      end

      step "User clicks Add to cart" do
        check_element_path :xpath, ProductPage::ADD_TO_CART_TA, ProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart
      end

      sleep 3
    end
  end
end
