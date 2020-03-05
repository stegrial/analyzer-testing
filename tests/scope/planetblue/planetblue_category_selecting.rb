require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/planetblue'

include ElementSearchValidation

it = PlanetBlue.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Planet Blue - category selecting' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks on Menu button" do
        it.click_menu_button
      end

      step "User clicks on Menu Category", 'Clothing' do |value|
        it.click_menu_category value
      end

      step "User clicks on Menu Category", 'Tops' do |value|
        it.click_menu_category value
      end

      step "User checks Category Dropdowns", 'REFINE', 'Sort' do |value1, value2|
        it.find_category_dropdown value1
        it.find_category_dropdown value2
      end

      step "User checks Collection Item",
           'RUTH TUNIC | NEW', 'BLUE LIFE', '150.00', 'Bright Rose' do |name, title, price, color|
        it.check_collection_item_attributes name, title, price, color
      end

    end

    # scenario 'Searching IL', il: true do

      # step "User goes to the page", settings('olx')['page'] do |url|
      #   page.visit url
      # end
      #
      # step "User clicks on animal category button" do
      #   check_element_path :xpath, Olx::ANIMAL_CATEGORY_TA, Olx::ANIMAL_CATEGORY_IL
      #   it.click_menu_button
      # end

      # step "User clicks on free animal matting button" do
      #   check_element_path :xpath, Olx::FREE_ANIMAL_MATING_TA, Olx::FREE_ANIMAL_MATING_IL
      #   it.click_free_animal_matting
      # end
      #
      # step "User clicks on gallary view button" do
      #   check_element_path :xpath, Olx::GALLERY_VIEW_TA, Olx::GALLERY_VIEW_IL
      #   it.click_gallery_view
      # end
      #
      # step "User clicks to select product" do
      #   check_element_path :xpath, Olx::PRODUCT_TA, Olx::PRODUCT_IL
      #   it.click_to_select_product
      # end
    # end

  end
end