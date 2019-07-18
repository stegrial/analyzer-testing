require 'spec_helper'

class Olx
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  ANIMAL_CATEGORY_IL = "(//a[@data-id='35'])[1]"
  ANIMAL_CATEGORY_TA = "olx:animal_category"
  ANIMAL_CATEGORY_EP = "EP:olx:animal_category"

  FREE_ANIMAL_MATING_IL = "//a[@data-id='1520']"
  FREE_ANIMAL_MATING_TA = "olx:free_animal_mating"
  FREE_ANIMAL_MATING_EP = "EP:olx:free_animal_mating"

  GALLERY_VIEW_IL = "(//ul[@id='viewSelector']/li)[3]"
  GALLERY_VIEW_TA = "olx:gallery_view"
  GALLERY_VIEW_EP = "EP:olx:gallery_view"

  PRODUCT_IL = "(//a[@class='marginright5 link linkWithHash detailsLink'])[20]"
  PRODUCT_TA = "olx:product"
  PRODUCT_EP = "EP:olx:product"

  def click_animal_category(key = nil)
    return find(:xpath, ta(ANIMAL_CATEGORY_EP)).click if key == :ep
    return find(:xpath, ANIMAL_CATEGORY_IL).click if key == :il
    find(:xpath, ta(ANIMAL_CATEGORY_TA, ANIMAL_CATEGORY_IL)).click
  end

  def click_free_animal_matting(key = nil)
    return find(:xpath, ta(FREE_ANIMAL_MATING_EP)).click if key == :ep
    return find(:xpath, FREE_ANIMAL_MATING_IL).click if key == :il
    find(:xpath, ta(FREE_ANIMAL_MATING_TA, FREE_ANIMAL_MATING_IL)).click
  end

  def click_gallery_view(key = nil)
    return find(:xpath, ta(GALLERY_VIEW_EP)).click if key == :ep
    return find(:xpath, GALLERY_VIEW_IL).click if key == :il
    find(:xpath, ta(GALLERY_VIEW_TA, GALLERY_VIEW_IL)).click
  end

  def click_to_select_product(key = nil)
    return find(:xpath, ta(PRODUCT_EP)).click if key == :ep
    return find(:xpath, PRODUCT_IL).click if key == :il
    find(:xpath, ta(PRODUCT_TA, PRODUCT_IL)).click
  end

end