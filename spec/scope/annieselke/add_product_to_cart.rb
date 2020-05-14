require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
product_page = ProductPage.new


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
        product_page.close_banner
        product_page.close_cupon_banner
      end

      step "Set mirrors in search field", "mirror\n" do |value|
        home_page.fill_search_input(value)

      end

      step "Click 'Tia Mirror' on product page" do
        product_page.click_tia_mirror_link
      end

      sleep 4 #wait until page is load

      step "User clicks size dropdown arrow", "/D%C3%A9cor-%26-Pillows/Tia-Mirror/p/ASH8714-ACS"  do |value|
        product_page.click_dropdown_arrow
        product_page.select_dropdown value
        product_page.close_banner
      end

      step "User clicks gallery img to change view" do
        product_page.click_to_change_gallery_img
      end

      step "User clicks gallery img to change view" do
        product_page.click_to_change_gallery_img
      end

      step "User clicks on Social networks icons" do
        product_page.close_cupon_banner
        product_page.click_on_facebook_icon

        move_between_tabs
        product_page.close_cupon_banner
        product_page.click_on_twitter_icon

        move_between_tabs
        product_page.close_cupon_banner
        product_page.click_on_pinterest_icon

        move_between_tabs
        product_page.close_cupon_banner
        product_page.click_on_houzz_icon
      end

    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end


    end
  end
end
