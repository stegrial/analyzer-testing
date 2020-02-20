require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

canada_page = TheTiebarCanada.new
pdp = TheTiebarProductPage.new
footer_page = TheTiebarFooterPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Canada Page  - click wedding shop' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
        page.visit url
      end

      step "User clicks on wedding shop link and redirected on wedding ties page" do
        sleep 5
        canada_page.click_wedding_shop
        sleep 5
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['canada_page'] do |url|
        page.visit url
      end

      step "User clicks on wedding shop link and redirected on wedding ties page" do
        # sleep 20
        check_element_path :xpath, TheTiebarCanada::SHOP_WEDDING_LINK_TA, TheTiebarCanada::SHOP_WEDDING_LINK_IL
        canada_page.click_wedding_shop
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

      end

    end
  end
end