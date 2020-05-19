require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

banner_page = BannerPage.new
header_page = HeaderPage.new
rugs_page = RugsPage.new
bedding_page = BeddingPage.new
furniture_page = FurniturePage.new
decor_pillows_page = DecorPillowsPage.new
bath_page = BathPage.new
window_page = WindowPage.new
apparel_page = ApparelPage.new
pet_page = PetPage.new
collections_page = CollectionsPage.new
gifts_page = GiftsPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Surfing by top navigation' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
        banner_page.close_banner
      end

      step "User clicks Rugs link on top navigation" do
        header_page.click_rugs_link
        rugs_page.should_see_rugs_h1
      end

      step "User clicks Bedding link on top navigation" do
        header_page.click_bedding_link
        bedding_page.should_see_bedding_h1
      end

      step "User clicks Furniture link on top navigation" do
        header_page.click_furniture_link
        furniture_page.should_see_furniture_h1
      end

      step "User clicks Decor and Pillows link on top navigation" do
        header_page.click_decor_pillows_link
        decor_pillows_page.should_see_decor_pillows_h1
      end

      step "User clicks Bath link on top navigation" do
        header_page.click_bath_link
        bath_page.should_see_bath_h1
      end

      step "User clicks Window link on top navigation" do
        header_page.click_window_link
        window_page.should_see_window_h1
      end

      step "User clicks Apparel link on top navigation" do
        header_page.click_apparel_link
        apparel_page.should_see_apparel_h1
      end

      step "User clicks Pet link on top navigation" do
        header_page.click_pet_link
        pet_page.should_see_pet_h1
      end

      step "User clicks Collections link on top navigation" do
        header_page.click_collections_link
        collections_page.should_see_collections_h1
      end

      step "User clicks Gifts link on top navigation" do
        header_page.click_gifts_link
        gifts_page.should_see_gifts_h1
      end

      step "User clicks Sale link on top navigation" do
        header_page.click_sale_link
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
        banner_page.close_banner
      end

      step "User clicks Rugs link on top navigation" do
        check_element_path :xpath, HeaderPage::RUGS_LINK_TA, HeaderPage::RUGS_LINK_IL
        header_page.click_rugs_link

        check_element_path :xpath, RugsPage::RUGS_H1_TA, RugsPage::RUGS_H1_IL
        rugs_page.should_see_rugs_h1
      end

      step "User clicks Bedding link on top navigation" do
        check_element_path :xpath, HeaderPage::BEDDING_LINK_TA, HeaderPage::BEDDING_LINK_IL
        header_page.click_bedding_link

        check_element_path :xpath, BeddingPage::BEDDING_H1_TA, BeddingPage::BEDDING_H1_IL
        bedding_page.should_see_bedding_h1
      end

      step "User clicks Furniture link on top navigation" do
        check_element_path :xpath, HeaderPage::FURNITURE_LINK_TA, HeaderPage::FURNITURE_LINK_IL
        header_page.click_furniture_link

        check_element_path :xpath, FurniturePage::FURNITURE_H1_TA, FurniturePage::FURNITURE_H1_IL
        furniture_page.should_see_furniture_h1
      end

      step "User clicks Decor and Pillows link on top navigation" do
        check_element_path :xpath, HeaderPage::DECOR_PILLOWS_LINK_TA, HeaderPage::DECOR_PILLOWS_LINK_IL
        header_page.click_decor_pillows_link

        check_element_path :xpath, DecorPillowsPage::DECOR_PILLOWS_H1_TA, DecorPillowsPage::DECOR_PILLOWS_H1_IL
        decor_pillows_page.should_see_decor_pillows_h1
      end

      step "User clicks Bath link on top navigation" do
        check_element_path :xpath, HeaderPage::BATH_LINK_TA, HeaderPage::BATH_LINK_IL
        header_page.click_bath_link

        check_element_path :xpath, BathPage::BATH_H1_TA, BathPage::BATH_H1_IL
        bath_page.should_see_bath_h1
      end

      step "User clicks Window link on top navigation" do
        check_element_path :xpath, HeaderPage::WINDOW_LINK_TA, HeaderPage::WINDOW_LINK_IL
        header_page.click_window_link

        check_element_path :xpath, WindowPage::WINDOW_H1_TA, WindowPage::WINDOW_H1_IL
        window_page.should_see_window_h1
      end

      step "User clicks Apparel link on top navigation" do
        check_element_path :xpath, HeaderPage::APPAREL_LINK_TA, HeaderPage::APPAREL_LINK_IL
        header_page.click_apparel_link

        check_element_path :xpath, ApparelPage::APPAREL_H1_TA, ApparelPage::APPAREL_H1_IL
        apparel_page.should_see_apparel_h1
      end

      step "User clicks Pet link on top navigation" do
        check_element_path :xpath, HeaderPage::PET_LINK_TA, HeaderPage::PET_LINK_IL
        header_page.click_pet_link

        check_element_path :xpath, PetPage::PET_H1_TA, PetPage::PET_H1_IL
        pet_page.should_see_pet_h1
      end

      step "User clicks Collections link on top navigation" do
        check_element_path :xpath, HeaderPage::COLLECTIONS_LINK_TA, HeaderPage::COLLECTIONS_LINK_IL
        header_page.click_collections_link

        check_element_path :xpath, CollectionsPage::COLLECTIONS_H1_TA, CollectionsPage::COLLECTIONS_H1_IL
        collections_page.should_see_collections_h1
      end

      step "User clicks Gifts link on top navigation" do
        check_element_path :xpath, HeaderPage::GIFTS_LINK_TA, HeaderPage::GIFTS_LINK_IL
        header_page.click_gifts_link

        check_element_path :xpath, GiftsPage::GIFTS_H1_TA, GiftsPage::GIFTS_H1_IL
        gifts_page.should_see_gifts_h1
      end

      step "User clicks Sale link on top navigation" do
        check_element_path :xpath, HeaderPage::SALE_LINK_TA, HeaderPage::SALE_LINK_IL
        header_page.click_sale_link
      end

      sleep 3
    end
  end
end
