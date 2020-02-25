require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Revese category' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        header_page.click_shirts_category
      end

      step "User clicks the pants category" do
        header_page.click_pants_category
      end

      step "User clicks on the neckties category" do
        header_page.click_neckties_category
      end

      step "User clicks on the skinnyties category" do
        header_page.click_skinnyties_category
      end

      step "User clicks on the bowties category" do
        header_page.click_bowties_category
      end

      step "User clicks the tiebars category" do
        header_page.click_tiebars_category
      end

      step "User clicks the socks category" do
        header_page.click_socks_category
      end

      step "User clicks the poket squares category" do
        header_page.click_pocket_squares_category
      end

      step "User clicks the accessories category" do
        header_page.click_accessories_category
      end

      step "User clicks the wedding category" do
        header_page.click_wedding_category
      end

      step "User clicks the gifts category" do
        header_page.click_gifts_category
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        check_element_path :xpath, TheTiebarHeader::SHIRTS_CATEGORY_TA, TheTiebarHeader::SHIRTS_CATEGORY_IL
        header_page.click_shirts_category
      end

      step "User clicks the pants category" do
        check_element_path :xpath, TheTiebarHeader::PANTS_CATEGORY_TA, TheTiebarHeader::PANTS_CATEGORY_IL
        header_page.click_pants_category
      end

      step "User clicks the neckties category" do
        check_element_path :xpath, TheTiebarHeader::NECKTIES_CATEGORY_TA, TheTiebarHeader::NECKTIES_CATEGORY_IL
        header_page.click_neckties_category
      end

      step "User clicks the skinnyties category" do
        check_element_path :xpath, TheTiebarHeader::SKINNYTIES_CATEGORY_TA, TheTiebarHeader::SKINNYTIES_CATEGORY_IL
        header_page.click_skinnyties_category
      end

      step "User clicks the bowties category" do
        check_element_path :xpath, TheTiebarHeader::BOWTIES_CATEGORY_TA, TheTiebarHeader::BOWTIES_CATEGORY_IL
        header_page.click_bowties_category
      end

      step "User clicks the tiebars category" do
        check_element_path :xpath, TheTiebarHeader::TIEBARS_CATEGORY_TA, TheTiebarHeader::TIEBARS_CATEGORY_IL
        header_page.click_tiebars_category
      end

      step "User clicks the socks category" do
        check_element_path :xpath, TheTiebarHeader::SOCKS_CATEGORY_TA, TheTiebarHeader::SOCKS_CATEGORY_IL
        header_page.click_socks_category
      end

      step "User clicks the poket squares category" do
        check_element_path :xpath, TheTiebarHeader::POCKET_SQUARES_CATEGORY_TA, TheTiebarHeader::POCKET_SQUARES_CATEGORY_IL
        header_page.click_pocket_squares_category
      end

      step "User clicks the accessories category" do
        check_element_path :xpath, TheTiebarHeader::ACCESSORIES_CATEGORY_TA, TheTiebarHeader::ACCESSORIES_CATEGORY_IL
        header_page.click_accessories_category
      end

      step "User clicks the wedding category" do
        check_element_path :xpath, TheTiebarHeader::WEDDING_CATEGORY_TA, TheTiebarHeader::WEDDING_CATEGORY_IL
        header_page.click_wedding_category
      end

      step "User clicks the gifts category" do
        check_element_path :xpath, TheTiebarHeader::GIFTS_CATEGORY_TA, TheTiebarHeader::GIFTS_CATEGORY_IL
        header_page.click_gifts_category
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks the shirts category" do
        check_element_path :xpath, TheTiebarHeader::SHIRTS_CATEGORY_EP, TheTiebarHeader::SHIRTS_CATEGORY_IL
        header_page.click_shirts_category :ep
      end

      step "User clicks the pants category" do
        check_element_path :xpath, TheTiebarHeader::PANTS_CATEGORY_EP, TheTiebarHeader::PANTS_CATEGORY_IL
        header_page.click_pants_category :ep
      end

      step "User clicks the neckties category" do
        check_element_path :xpath, TheTiebarHeader::NECKTIES_CATEGORY_EP, TheTiebarHeader::NECKTIES_CATEGORY_IL
        header_page.click_neckties_category :ep
      end

      step "User clicks the skinnyties category" do
        check_element_path :xpath, TheTiebarHeader::SKINNYTIES_CATEGORY_EP, TheTiebarHeader::SKINNYTIES_CATEGORY_IL
        header_page.click_skinnyties_category :ep
      end

      step "User clicks the bowties category" do
        check_element_path :xpath, TheTiebarHeader::BOWTIES_CATEGORY_EP, TheTiebarHeader::BOWTIES_CATEGORY_IL
        header_page.click_bowties_category :ep
      end

      step "User clicks the tiebars category" do
        check_element_path :xpath, TheTiebarHeader::TIEBARS_CATEGORY_EP, TheTiebarHeader::TIEBARS_CATEGORY_IL
        header_page.click_tiebars_category :ep
      end

      step "User clicks the socks category" do
        check_element_path :xpath, TheTiebarHeader::SOCKS_CATEGORY_EP, TheTiebarHeader::SOCKS_CATEGORY_IL
        header_page.click_socks_category :ep
      end

      step "User clicks the poket squares category" do
        check_element_path :xpath, TheTiebarHeader::POCKET_SQUARES_CATEGORY_EP, TheTiebarHeader::POCKET_SQUARES_CATEGORY_IL
        header_page.click_pocket_squares_category :ep
      end

      step "User clicks the accessories category" do
        check_element_path :xpath, TheTiebarHeader::ACCESSORIES_CATEGORY_EP, TheTiebarHeader::ACCESSORIES_CATEGORY_IL
        header_page.click_accessories_category :ep
      end

      step "User clicks the wedding category" do
        check_element_path :xpath, TheTiebarHeader::WEDDING_CATEGORY_EP, TheTiebarHeader::WEDDING_CATEGORY_IL
        header_page.click_wedding_category :ep
      end

      step "User clicks the gifts category" do
        check_element_path :xpath, TheTiebarHeader::GIFTS_CATEGORY_EP, TheTiebarHeader::GIFTS_CATEGORY_IL
        header_page.click_gifts_category :ep
      end

    end
  end
end