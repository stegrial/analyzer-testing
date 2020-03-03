require 'spec_helper'
require_relative 'page_extension'


class Staffclothes
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  HUMBURGER_MENU_IL = "//div[@class='hamburger-inner']"
  HUMBURGER_MENU_TA = "staff:hamburger"
  HUMBURGER_MENU_EP = "EP:staff:hamburger"

  MEN_CATEGORY_IL = "//div[text()='Для парней']"
  MEN_CATEGORY_TA = "staff:for_men"
  MEN_CATEGORY_EP = "EP:staff:for_men"

  POLO_TSHIRTS_IL = "//div[@style='height: inherit;'][5]"
  POLO_TSHIRTS_TA = "staff:polo_Tshirts"
  POLO_TSHIRTS_EP = "EP:staff:polo_Tshirts"

  CHOOSE_POLO_IL = "(//span[@class='product-card__info--title'])[2]"
  CHOOSE_POLO_TA = "staff:choose_polo"
  CHOOSE_POLO_EP = "EP:staff:choose_polo"

  CHOOSE_SIZE_IL = "(//button[@class='product__sizes '])[1]"
  CHOOSE_SIZE_TA = "staff:choose_size"
  CHOOSE_SIZE_EP = "EP:staff:choose_size"

  ADD_TO_CART_IL = "(//button[@class='main-button'])[1]"
  ADD_TO_CART_TA = "staff:add_to_cart"
  ADD_TO_CART_EP = "EP:staff:add_to_cart"

  GO_TO_CART_BTN_IL = "//div[@class='modal__success-error-button modal__success-error-button--black']"
  GO_TO_CART_BTN_TA = "staff:changing_btn"
  GO_TO_CART_BTN_EP = "EP:staff:changing_btn"

  DELETE_PRDER_IL = "//button[@class='cart__delete']"
  DELETE_PRDER_TA = "staff:delete_order"
  DELETE_PRDER_EP = "EP:staff:delete_order"

  COMEBACK_TO_CATALOG_IL = "//button[@class='main-button']"
  COMEBACK_TO_CATALOG_TA = "staff:update_cart"
  COMEBACK_TO_CATALOG_EP = "EP:staff:update_cart"

  def click_humburg_menu(key = nil)
    post_processing key do
      return find(:xpath, ta(HUMBURGER_MENU_EP)).click  if key == :ep
      return find(:xpath, HUMBURGER_MENU_IL).click  if key == :il
      find(:xpath, ta(HUMBURGER_MENU_TA, HUMBURGER_MENU_IL)).click
    end
  end

  def click_men_category(key = nil)
    post_processing key do
      return find(:xpath, ta(MEN_CATEGORY_EP)).click if key == :ep
      return find(:xpath, MEN_CATEGORY_IL).click if key == :il
      find(:xpath, ta(MEN_CATEGORY_TA, MEN_CATEGORY_IL)).click
    end
  end

  def click_polo_tshirts(key = nil)
    post_processing key do
      return find(:xpath, ta(POLO_TSHIRTS_EP)).click if key == :ep
      return find(:xpath, POLO_TSHIRTS_IL).click if key == :il
      find(:xpath, ta(POLO_TSHIRTS_TA, POLO_TSHIRTS_IL)).click
    end
  end

  def click_to_choose_polo(key = nil)
    post_processing key do
      return find(:xpath, ta(CHOOSE_POLO_EP)).click if key == :ep
      return find(:xpath, CHOOSE_POLO_IL).click if key == :il
      find(:xpath, ta(CHOOSE_POLO_TA, CHOOSE_POLO_IL)).click
    end
  end

  def click_to_choose_size(key = nil)
    post_processing key do
      return find(:xpath, ta(CHOOSE_SIZE_EP)).click if key == :ep
      return find(:xpath, CHOOSE_SIZE_IL).click if key == :il
      find(:xpath, ta(CHOOSE_SIZE_TA, CHOOSE_SIZE_IL)).click
    end
  end

  def click_to_add_to_cart(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_TO_CART_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
    end
  end

  def click_to_change_cart(key = nil)
    post_processing key do
      return find(:xpath, ta(GO_TO_CART_BTN_EP)).click if key == :ep
      return find(:xpath, GO_TO_CART_BTN_IL).click if key == :il
      find(:xpath, ta(GO_TO_CART_BTN_TA, GO_TO_CART_BTN_IL)).click
    end
  end

  def click_to_delete_order(key = nil)
    post_processing key do
      return find(:xpath, ta(DELETE_PRDER_EP)).click if key == :ep
      return find(:xpath, DELETE_PRDER_IL).click if key == :il
      find(:xpath, ta(DELETE_PRDER_TA, DELETE_PRDER_IL)).click
    end
  end

  def click_to_update_cart(key = nil)
    post_processing key do
      return find(:xpath, ta(COMEBACK_TO_CATALOG_EP)).click if key == :ep
      return find(:xpath, COMEBACK_TO_CATALOG_IL).click if key == :il
      find(:xpath, ta(COMEBACK_TO_CATALOG_TA, COMEBACK_TO_CATALOG_IL)).click
    end
  end

end



