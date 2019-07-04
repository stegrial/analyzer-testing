require 'capybara/rspec'
require 'selenium-webdriver'

module StaffClothes

  def initialize(*args)
    @hamburger_menu_il = "//div[@class='hamburger-inner']"
    @hamburger_menu_ta = "staff:hamburger"
    @hamburger_menu_ep = "EP:staff:hamburger"

    @men_category_il = "//div[text()='Для парней']"
    @men_category_ta = "staff:for_men"
    @men_category_ep = "EP:staff:for_men"

    @polo_tshirts_il = "//div[@style='height: inherit;'][5]"
    @polo_tshirts_ta = "staff:polo_Tshirts"
    @polo_tshirts_ep = "EP:staff:polo_Tshirts"

    @choose_polo_il = "(//span[@class='product-card__info--title'])[2]"
    @choose_polo_ta = "staff:choose_polo"
    @choose_polo_ep = "EP:staff:choose_polo"

    @choose_size_il = "(//button[@class='product__sizes '])[1]"
    @choose_size_ta = "staff:choose_size"
    @choose_size_ep = "EP:staff:choose_size"

    @add_to_cart_il = "(//button[@class='main-button'])[1]"
    @add_to_cart_ta = "staff:add_to_cart"
    @add_to_cart_ep = "EP:staff:add_to_cart"

    @go_to_cart_btn_il = "//div[@class='modal__success-error-button modal__success-error-button--black']"
    @go_to_cart_btn_ta = "staff:changing_btn"
    @go_to_cart_btn_ep = "EP:staff:changing_btn"

    @delete_order_il = "//button[@class='cart__delete']"
    @delete_order_ta = "staff:delete_order"
    @delete_order_ep = "EP:staff:delete_order"

    @comeback_to_catalog_il = "//button[@class='main-button']"
    @comeback_to_catalog_ta = "staff:update_cart"
    @comeback_to_catalog_ep = "EP:staff:update_cart"
    super
  end

  def click_humburg_menu(ep = false)
    return find(:xpath, ta(@hamburger_menu_ep)).click if ep
    find(:xpath, ta(@hamburger_menu_ta, @hamburger_menu_il)).click
  end

  def click_men_category(ep = false)
    return find(:xpath, ta(@men_category_ep)).click if ep
    find(:xpath, ta(@men_category_ta, @men_category_il)).click
  end

  def click_polo_tshirts(ep = false)
    return find(:xpath, ta(@polo_tshirts_ep)).click if ep
    find(:xpath, ta(@polo_tshirts_ta, @polo_tshirts_il)).click
  end

  def click_to_choose_polo(ep = false)
    return find(:xpath, ta(@choose_polo_ep)).click if ep
    find(:xpath, ta(@choose_polo_ta, @choose_polo_il)).click
  end

  def click_to_choose_size(ep = false)
    return find(:xpath, ta(@choose_size_ep)).click if ep
    find(:xpath, ta(@choose_size_ta, @choose_size_il)).click
  end

  def click_to_add_to_cart(ep = false)
    return find(:xpath, ta(@add_to_cart_ep)).click if ep
    find(:xpath, ta(@add_to_cart_ta, @add_to_cart_il)).click
  end

  def click_to_change_cart(ep = false)
    return find(:xpath, ta(@go_to_cart_btn_ep)).click if ep
    find(:xpath, ta(@go_to_cart_btn_ta, @go_to_cart_btn_il)).click
  end

  def click_to_delete_order(ep = false)
    return find(:xpath, ta(@delete_order_ep)).click if ep
    find(:xpath, ta(@delete_order_ta, @delete_order_il)).click
  end

  def click_to_update_cart(ep = false)
    return find(:xpath, ta(@comeback_to_catalog_ep)).click if ep
    find(:xpath, ta(@comeback_to_catalog_ta, @comeback_to_catalog_il)).click
  end

end



