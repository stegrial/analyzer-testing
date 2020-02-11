require 'spec_helper'
require_relative '../helpers/special_methods'

class Stagecom
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  HUMBURGER_MENU_IL = "//a[@on='tap:moov_menu.toggle']"
  # HUMBURGER_MENU_IL = "//button[@aria-label='Menu']"
  HUMBURGER_MENU_TA = "stage_com:humburger_menu"
  HUMBURGER_MENU_EP = "EP:stage_com:humburger_menu"

  SIGNIN_LINK_IL = "//button[text()='Sign in']"
  SIGNIN_LINK_TA = "stage_com:signin_link"
  SIGNIN_LINK_EP = "EP:stage_com:signin_link"

  ACCOUNT_EMAIL_IL = "//input[@id='email']"
  ACCOUNT_EMAIL_TA = "stage_com:email"
  ACCOUNT_EMAIL_EP = "EP:stage_com:email"

  PASS_IL = "//input[@id='password']"
  PASS_TA = "stage_com:pass"
  PASS_EP = "EP:stage_com:pass"

  SIGNIN_BTN_IL = "//input[@value='sign in']"
  SIGNIN_BTN_TA = "stage_com:sigin_btn"
  SIGNIN_BTN_EP = "EP:stage_com:sigin_btn"

  LOGO_IL = "//a[@class='m-header__logo']"
  LOGO_TA = "stage_com:logo"
  LOGO_EP = "EP:stage_com:logo"

  MINICART_IL = "//button[@aria-label='Cart']"
  MINICART_TA = "stage_com:minicart"
  MINICART_EP = "EP:stage_com:minicart"

  CATEGORY_KIDS_IL = "(//div[text()='Kids'])[1]"
  CATEGORY_KIDS_TA = "stage_com:category_kids"
  CATEGORY_KIDS_EP = "EP:stage_com:category_kids"

  SUBCATEGORY_BABY_IL = "(//div[text()='Baby'])[1]"
  SUBCATEGORY_BABY_TA = "stage_com:subcategory_baby"
  SUBCATEGORY_BABY_EP = "EP:stage_com:subcategory_baby"

  SUBCATEGORY_BABYGIRL_IL = "(//div[text()='Baby Girl (0-24 months)'])[1]"
  SUBCATEGORY_BABYGIRL_TA = "stage_com:subcategory_babygirl"
  SUBCATEGORY_BABYGIRL_EP = "EP:stage_com:subcategory_babygirl"

  GIRL_DRESS_IL = "(//a[contains(., 'Dresses')])[2]"
  GIRL_DRESS_TA = "stage_com:girl_dress"
  GIRL_DRESS_EP = "EP:stage_com:girl_dress"

  PINK_DRESS_IL = "(//h6[text()])[2]"
  PINK_DRESS_TA = "stage_com:pink_dress"
  PINK_DRESS_EP = "EP:stage_com:pink_dress"

  BABY_SIZE_IL = "//button/span[text()='12months']"
  BABY_SIZE_TA = "stage_com:baby_size"
  BABY_SIZE_EP = "EP:stage_com:baby_size"

  ADD_TO_CART_IL = "//span[text()='Add To Bag']"
  ADD_TO_CART_TA = "stage_com:add_to_cart"
  ADD_TO_CART_EP = "EP:stage_com:add_to_cart"


  def click_humburger_menu(key = nil)
    post_processing key do
      return find(:xpath, ta(HUMBURGER_MENU_EP)).click if key == :ep
      return find(:xpath, HUMBURGER_MENU_IL).click if key == :il
      find(:xpath, ta(HUMBURGER_MENU_TA, HUMBURGER_MENU_IL)).click
    end
  end

  def click_signin_link(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGNIN_LINK_EP)).click if key == :ep
      return find(:xpath, SIGNIN_LINK_IL).click if key == :il
      find(:xpath, ta(SIGNIN_LINK_TA, SIGNIN_LINK_IL)).click
    end
  end

  def click_account_email(email, key = nil)
    return find(:xpath, ta(ACCOUNT_EMAIL_EP)).click if key == :ep
    return find(:xpath, ACCOUNT_EMAIL_IL).click if key == :il
    find(:xpath, ta(ACCOUNT_EMAIL_TA, ACCOUNT_EMAIL_IL)).set(email)
  end

  def click_pass (pass, key = nil)
    return find(:xpath, ta(PASS_EP)).set(pass) if key == :ep
    return find(:xpath, PASS_IL).set(pass) if key == :il
    find(:xpath, ta(PASS_TA, PASS_IL)).set(pass)
  end

  def click_signin_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGNIN_BTN_EP)).click if key == :ep
      return find(:xpath, SIGNIN_BTN_IL).click if key == :il
      find(:xpath, ta(SIGNIN_BTN_TA, SIGNIN_BTN_IL)).click
    end
  end

  def click_logo(key = nil)
    post_processing key do
      return find(:xpath, ta(LOGO_EP)).click if key == :ep
      return find(:xpath, LOGO_IL).click if key == :il
      find(:xpath, ta(LOGO_TA, LOGO_IL)).click
    end
  end

  def click_minicart(key = nil)
    post_processing key do
      return find(:xpath, ta(MINICART_EP)).click if key == :ep
      return find(:xpath, MINICART_IL).click if key == :il
      find(:xpath, ta(MINICART_TA, MINICART_IL)).click
    end
  end

  def click_category_kids(key = nil)
    post_processing key do
      return find(:xpath, ta(CATEGORY_KIDS_EP)).click if key == :ep
      return find(:xpath, CATEGORY_KIDS_IL).click if key == :il
      find(:xpath, ta(CATEGORY_KIDS_TA, CATEGORY_KIDS_IL)).click
    end
  end

  def click_subcategory_baby(key = nil)
    post_processing key do
      return find(:xpath, ta(SUBCATEGORY_BABY_EP)).click if key == :ep
      return find(:xpath, SUBCATEGORY_BABY_IL).click if key == :il
      find(:xpath, ta(SUBCATEGORY_BABY_TA, SUBCATEGORY_BABY_IL)).click
    end
  end

  def click_subcategory_babygirl(key = nil)
    post_processing key do
      return find(:xpath, ta(SUBCATEGORY_BABYGIRL_EP)).click if key == :ep
      return find(:xpath, SUBCATEGORY_BABYGIRL_IL).click if key == :il
      find(:xpath, ta(SUBCATEGORY_BABYGIRL_TA, SUBCATEGORY_BABYGIRL_IL)).click
    end
  end

  def click_girl_dress(key = nil)
    post_processing key do
      return find(:xpath, ta(GIRL_DRESS_EP)).click if key == :ep
      return find(:xpath, GIRL_DRESS_IL).click if key == :il
      find(:xpath, ta(GIRL_DRESS_TA, GIRL_DRESS_IL)).click
    end
  end

  def click_pink_dress(key = nil)
    post_processing key do
      return find(:xpath, ta(PINK_DRESS_EP)).click if key == :ep
      return find(:xpath, PINK_DRESS_IL).click if key == :il
      find(:xpath, ta(PINK_DRESS_TA, PINK_DRESS_IL)).click
    end
  end

  def click_baby_size(key = nil)
    post_processing key do
      return find(:xpath, ta(BABY_SIZE_EP)).click if key == :ep
      return find(:xpath, BABY_SIZE_IL).click if key == :il
      find(:xpath, ta(BABY_SIZE_TA, BABY_SIZE_IL)).click
    end
  end

  def click_add_to_cart(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_TO_CART_EP)).click if key == :ep
      return find(:xpath, ADD_TO_CART_IL).click if key == :il
      find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
    end
  end

  def close_modal
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end
  end

  def close_modal_rewards
    if page.has_xpath?("//button[@class='modal__header__close-button']")
      find(:xpath, "//button[@class='modal__header__close-button']").click
    end
  end

  def close_modal_feedback
    if page.has_xpath?("//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']")
      find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
    end
  end

end