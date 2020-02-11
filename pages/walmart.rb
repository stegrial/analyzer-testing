require 'spec_helper'
require_relative '../helpers/special_methods'

class Walmart
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  HUMBURGER_BTN_IL = "//button[@aria-label='Menu']"
  HUMBURGER_BTN_TA = "walmart:hamburger_btn"
  HUMBURGER_BTN_EP = "EP:walmart:hamburger_btn"

  BABY_CATEGORY_IL = "//button[@data-sub-depts-nav-target='dept-rZWIC4AC-children']"
  BABY_CATEGORY_TA = "walmart:baby_category"
  BABY_CATEGORY_EP = "EP:walmart:baby_category"

  FEEDING_IL = "//span[text()='Feeding']"
  FEEDING_TA = "walmart:feeding"
  FEEDING_EP = "EP:walmart:feeding"

  BABY_FOOD_IL = "//div[text()='Baby Food']"
  BABY_FOOD_TA = "walmart:baby_food"
  BABY_FOOD_EP = "EP:walmart:baby_food"

  PUREES_FOOD_IL = "//a[@aria-label='Purees']"
  PUREES_FOOD_TA = "walmart:purees"
  PUREES_FOOD_EP = "EP:walmart:purees"

  PRODUCT_IL = "(//span[@class='product-sub-title'])[1]"
  PRODUCT_TA = "walmart:select_product"
  PRODUCT_EP = "EP:walmart:select_product"

  ADD_TO_REGISTRY_IL = "span.AddToRegistry-text"
  ADD_TO_REGISTRY_TA = "walmart:add_to_cart"
  ADD_TO_REGISTRY_EP = "EP:walmart:add_to_cart"

  def click_humburger_menu(key = nil)
    post_processing key do
      return find(:xpath, ta(HUMBURGER_BTN_EP)).click if key == :ep
      return find(:xpath, HUMBURGER_BTN_IL).click if key == :il
      find(:xpath, ta(HUMBURGER_BTN_TA, HUMBURGER_BTN_IL)).click
    end
  end

  def click_baby_category(key = nil)
    post_processing key do
      return find(:xpath, ta(BABY_CATEGORY_EP)).click if key == :ep
      return find(:xpath, BABY_CATEGORY_IL).click if key == :il
      find(:xpath, ta(BABY_CATEGORY_TA, BABY_CATEGORY_IL)).click
    end
  end

  def click_feeding(key = nil)
    post_processing key do
      return find(:xpath, ta(FEEDING_EP)).click if key == :ep
      return find(:xpath, FEEDING_IL).click if key == :il
      find(:xpath, ta(FEEDING_TA, FEEDING_IL)).click
    end
  end

  def click_baby_food(key = nil)
    post_processing key do
      return find(:xpath, ta(BABY_FOOD_EP)).click if key == :ep
      return find(:xpath, BABY_FOOD_IL).click if key == :il
      find(:xpath, ta(BABY_FOOD_TA, BABY_FOOD_IL)).click
    end
  end

  def click_purees(key = nil)
    post_processing key do
      return find(:xpath, ta(PUREES_FOOD_EP)).click if key == :ep
      return find(:xpath, PUREES_FOOD_IL).click if key == :il
      find(:xpath, ta(PUREES_FOOD_TA, PUREES_FOOD_IL)).click
    end
  end

  def click_to_select_product(key = nil)
    post_processing key do
      return find(:xpath, ta(PRODUCT_EP)).click if key == :ep
      return find(:xpath, PRODUCT_IL).click if key == :il
      find(:xpath, ta(PRODUCT_TA, PRODUCT_IL)).click
    end
  end

  def click_for_add_to_registry(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_TO_REGISTRY_EP)).click if key == :ep
      return find(:css, ADD_TO_REGISTRY_IL).click if key == :il
      find(:css, ta(ADD_TO_REGISTRY_TA, ADD_TO_REGISTRY_IL)).click
    end
  end

end