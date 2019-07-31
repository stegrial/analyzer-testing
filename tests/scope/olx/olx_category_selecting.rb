require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/olx'

it = Olx.new

feature 'OLX - category selecting' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('olx')['page'] do |url|
      page.visit url
    end

    step "User clicks on animal category button" do
      it.click_animal_category
    end

    step "User clicks on free animal matting button" do
      it.click_free_animal_matting
    end

    step "User clicks on gallary view button" do
      it.click_gallery_view
    end

    step "User clicks to select product" do
      sleep 3
      it.click_to_select_product
    end


  end

  scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('olx')['page'] do |url|
      page.visit url
    end

    step "User clicks on animal category button" do
      check_element_path :xpath, Olx::ANIMAL_CATEGORY_TA, Olx::ANIMAL_CATEGORY_IL
      it.click_animal_category
    end

    step "User clicks on free animal matting button" do
      check_element_path :xpath, Olx::FREE_ANIMAL_MATING_TA, Olx::FREE_ANIMAL_MATING_IL
      it.click_free_animal_matting
    end

    step "User clicks on gallary view button" do
      check_element_path :xpath, Olx::GALLERY_VIEW_TA, Olx::GALLERY_VIEW_IL
      it.click_gallery_view
    end

    step "User clicks to select product" do
      check_element_path :xpath, Olx::PRODUCT_TA, Olx::PRODUCT_IL
      it.click_to_select_product
    end

  end

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('olx')['page'] do |url|
      page.visit url
    end

    step "User clicks on animal category button" do
     sleep 4
      check_element_path :xpath, Olx::ANIMAL_CATEGORY_EP, Olx::ANIMAL_CATEGORY_IL
      it.click_animal_category
    end

    step "User clicks on free animal matting button" do
      check_element_path :xpath, Olx::FREE_ANIMAL_MATING_EP, Olx::FREE_ANIMAL_MATING_IL
      it.click_free_animal_matting
    end

    step "User clicks on gallary view button" do
      check_element_path :xpath, Olx::GALLERY_VIEW_EP, Olx::GALLERY_VIEW_IL
      it.click_gallery_view
    end

    step "User clicks to select product" do
      check_element_path :xpath, Olx::PRODUCT_EP, Olx::PRODUCT_IL
      it.click_to_select_product
    end

  end
end
