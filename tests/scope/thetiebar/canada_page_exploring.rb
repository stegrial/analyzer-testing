require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

locations_page = TheTiebarLocation.new
canada_page = TheTiebarCanada.new
pdp = TheTiebarProductPage.new
footer_page = TheTiebarFooterPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Canada Page exploring' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
        page.visit url
      end

      step "User clicks on wedding shop link and redirected on wedding ties page" do
        canada_page.click_wedding_shop
        pdp.should_see_wedding_ties__h1
      end

      step "User clicks on the Canada link in footer and redirected on Canada ties page" do
        footer_page.click_canada
        canada_page.should_see_canada_h1
      end

      step "User clicks on shirts shop link and redirected on shirts page" do
        canada_page.click_shirts_shop
        pdp.should_see_shirts_h1
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
        page.visit url
      end

      step "User clicks on wedding shop link and redirected on wedding ties page" do
        check_element_path :xpath, TheTiebarCanada::SHOP_WEDDING_LINK_TA, TheTiebarCanada::SHOP_WEDDING_LINK_IL
        canada_page.click_wedding_shop
        check_element_path :xpath, TheTiebarProductPage::WEDDING_TIES_H1_TA, TheTiebarProductPage::WEDDING_TIES_H1_IL
        pdp.should_see_wedding_ties__h1
      end

      step "User clicks on the Canada link in footer and redirected on Canada ties page" do
        check_element_path :xpath, TheTiebarFooterPage::CANADA_TA, TheTiebarFooterPage::CANADA_IL
        footer_page.click_canada
        check_element_path :xpath, TheTiebarCanada::THE_TIABAR_CANADA_H1_TA, TheTiebarCanada::THE_TIABAR_CANADA_H1_IL
        canada_page.should_see_canada_h1
      end

      step "User clicks on shirts shop link and redirected on shirts page" do
        check_element_path :xpath, TheTiebarCanada::SHIRTS_SHOP_LINK_TA, TheTiebarCanada::SHIRTS_SHOP_LINK_IL
        canada_page.click_shirts_shop
        check_element_path :xpath, TheTiebarProductPage::SHIRTS_H1_TA, TheTiebarProductPage::SHIRTS_H1_IL
        pdp.should_see_shirts_h1
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
        page.visit url
      end

      step "User clicks on wedding shop link and redirected on wedding ties page" do
        check_element_path :xpath, TheTiebarCanada::SHOP_WEDDING_LINK_EP, TheTiebarCanada::SHOP_WEDDING_LINK_IL
        canada_page.click_wedding_shop :ep
        check_element_path :xpath, TheTiebarProductPage::WEDDING_TIES_H1_EP, TheTiebarProductPage::WEDDING_TIES_H1_IL
        pdp.should_see_wedding_ties__h1 :ep
      end

      step "User clicks on the Canada link in footer and redirected on Canada ties page" do
        check_element_path :xpath, TheTiebarFooterPage::CANADA_EP, TheTiebarFooterPage::CANADA_IL
        footer_page.click_canada :ep
        check_element_path :xpath, TheTiebarCanada::THE_TIABAR_CANADA_H1_EP, TheTiebarCanada::THE_TIABAR_CANADA_H1_IL
        canada_page.should_see_canada_h1 :ep
      end

      step "User clicks on shirts shop link and redirected on shirts page" do
        check_element_path :xpath, TheTiebarCanada::SHIRTS_SHOP_LINK_EP, TheTiebarCanada::SHIRTS_SHOP_LINK_IL
        canada_page.click_shirts_shop :ep
        check_element_path :xpath, TheTiebarProductPage::SHIRTS_H1_EP, TheTiebarProductPage::SHIRTS_H1_IL
        pdp.should_see_shirts_h1 :ep
      end
    end
  end
end