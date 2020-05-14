require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
banner_page = BannerPage.new
header_page = HeaderPage.new
pet_page = PetPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Filtering Pet product' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
        banner_page.close_banner
      end

      step "User clicks Pet link on top navigation" do
        header_page.click_pet_link
        banner_page.close_cupon_banner
      end

      step "User clicks filter size medium" do
        pet_page.click_on_filter_size_medium
        pet_page.should_see_filter_size_medium
      end

      step "User clicks filter size medium/large" do
        pet_page.click_on_filter_size_med_lar
        pet_page.should_see_filter_size_med_lar
      end

      step "User clicks dropdown colors" do
        pet_page.click_on_dropdown_colors
      end

      step "User clicks grey color" do
        pet_page.click_on_grey_color
        pet_page.should_see_filter_color_grey
      end

      step "User clicks dropdown pattern" do
        pet_page.click_on_dropdown_pattern
      end

      step "User clicks Stripe pattern" do
        pet_page.click_on_stripe_pattern
        pet_page.should_see_filter_pat_stripe
      end

      step "User clicks dropdown material" do
        pet_page.click_on_dropdown_material
      end

      step "User clicks Polypropylene material" do
        pet_page.click_on_polypropylene_mater
        pet_page.should_see_filter_mater_polyp
      end

      step "User clicks First product link" do
        pet_page.click_on_first_product
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
        banner_page.close_banner
      end

      step "User clicks Pet link on top navigation" do
        check_element_path :xpath, HeaderPage::PET_LINK_TA, HeaderPage::PET_LINK_IL
        header_page.click_pet_link
        banner_page.close_cupon_banner
      end

      step "User clicks filter size medium" do
        check_element_path :xpath, PetPage::SIZE_MEDIUM_LINK_TA, PetPage::SIZE_MEDIUM_LINK_IL
        pet_page.click_on_filter_size_medium

        check_element_path :xpath, PetPage::SEARCH_SIZE_MEDIUM_TA, PetPage::SEARCH_SIZE_MEDIUM_IL
        pet_page.should_see_filter_size_medium
      end

      step "User clicks filter size medium/large" do
        check_element_path :xpath, PetPage::SIZE_MEDIUM_LARGE_LINK_TA, PetPage::SIZE_MEDIUM_LARGE_LINK_IL
        pet_page.click_on_filter_size_med_lar

        check_element_path :xpath, PetPage::SEARCH_SIZE_MEDIUM_LARGE_TA, PetPage::SEARCH_SIZE_MEDIUM_LARGE_IL
        pet_page.should_see_filter_size_med_lar
      end

      step "User clicks dropdown colors" do
        check_element_path :xpath, PetPage::DROPDOWN_COLORS_TA, PetPage::DROPDOWN_COLORS_IL
        pet_page.click_on_dropdown_colors
      end

      step "User clicks grey color" do
        check_element_path :xpath, PetPage::GREY_COLOR_TA, PetPage::GREY_COLOR_IL
        pet_page.click_on_grey_color

        check_element_path :xpath, PetPage::SEARCH_GREY_TA, PetPage::SEARCH_GREY_IL
        pet_page.should_see_filter_color_grey
      end

      step "User clicks dropdown pattern" do
        check_element_path :xpath, PetPage::DROPDOWN_PATTERN_TA, PetPage::DROPDOWN_PATTERN_IL
        pet_page.click_on_dropdown_pattern
      end

      step "User clicks Stripe pattern" do
        check_element_path :xpath, PetPage::STRIPE_PATTERN_TA, PetPage::STRIPE_PATTERN_IL
        pet_page.click_on_stripe_pattern

        check_element_path :xpath, PetPage::SEARCH_STRIPE_TA, PetPage::SEARCH_STRIPE_IL
        pet_page.should_see_filter_pat_stripe
      end

      step "User clicks dropdown material" do
        check_element_path :xpath, PetPage::DROPDOWN_MATERIAL_TA, PetPage::DROPDOWN_MATERIAL_IL
        pet_page.click_on_dropdown_material
      end

      step "User clicks Polypropylene material" do
        check_element_path :xpath, PetPage::POLYPROPYLENE_MATERIAL_TA, PetPage::POLYPROPYLENE_MATERIAL_IL
        pet_page.click_on_polypropylene_mater

        check_element_path :xpath, PetPage::SEARCH_POLYPROPYLENE_TA, PetPage::SEARCH_POLYPROPYLENE_IL
        pet_page.should_see_filter_mater_polyp
      end

      step "User clicks First product link" do
        check_element_path :xpath, PetPage::FIRST_PRODUCT_LINK_TA, PetPage::FIRST_PRODUCT_LINK_IL
        pet_page.click_on_first_product
      end

      sleep 3
    end
  end
end
