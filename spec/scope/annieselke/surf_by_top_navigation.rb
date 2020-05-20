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
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surfing by top navigation' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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
      end
    end
  end
end
