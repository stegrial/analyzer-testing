require 'capybara/rspec'
require 'selenium-webdriver'

module StageCom

  def initialize(*args)
    @humburger_menu_il = "//button[@id='nav-button']"
    @humburger_menu_ta = "stage_com:humburger_menu"
    @humburger_menu_ep = "EP:stage_com:humburger_menu"

    @signin_link_il = "//p[@class='m-menu__account__links']/a[text()='Sign in']"
    @signin_link_ta = "stage_com:signin_link"
    @signin_link_ep = "EP:stage_com:signin_link"

    @account_email_il = "//input[@id='email']"
    @account_email_ta = "stage_com:email"
    @account_email_ep = "EP:stage_com:email"

    @pass_il = "//input[@id='password']"
    @pass_ta = "stage_com:pass"
    @pass_ep = "EP:stage_com:pass"

    @signin_btn_il = "//input[@value='sign in']"
    @signin_btn_ta = "stage_com:sigin_btn"
    @signin_btn_ep = "EP:stage_com:sigin_btn"

    @logo_il = "//a[@class='m-header__logo']"
    @logo_ta = "stage_com:logo"
    @logo_ep = "EP:stage_com:logo"

    @minicart_il = "//a[@class='m-header__minicart m-header__miniCartInnerContent']"
    @minicart_ta = "stage_com:minicart"
    @minicart_ep = "EP:stage_com:minicart"

    @category_kids_il = "//ul/a[@data-menu-id='Kids']"
    @category_kids_ta = "stage_com:category_kids"
    @category_kids_ep = "EP:stage_com:category_kids"

    @subcategory_baby_il = "(//a[text()='Baby'])[1]"
    @subcategory_baby_ta = "stage_com:subcategory_baby"
    @subcategory_baby_ep = "EP:stage_com:subcategory_baby"

    @subcategory_babygirl_il = "(//a[text()='Baby Girl (0-24 months)'])[1]"
    @subcategory_babygirl_ta = "stage_com:subcategory_babygirl"
    @subcategory_babygirl_ep = "EP:stage_com:subcategory_babygirl"

    @girl_dress_il = "//h2[text()='Dresses']"
    @girl_dress_ta = "stage_com:girl_dress"
    @girl_dress_ep = "EP:stage_com:girl_dress"

    @pink_dress_il = "(//a[@class='product-image'])[1]"
    @pink_dress_ta = "stage_com:pink_dress"
    @pink_dress_ep = "EP:stage_com:pink_dress"

    @baby_size_il = "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]"
    @baby_size_ta = "stage_com:baby_size"
    @baby_size_ep = "EP:stage_com:baby_size"

    @add_to_cart_il = "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]"
    @add_to_cart_ta = "stage_com:add_to_cart"
    @add_to_cart_ep = "EP:stage_com:add_to_cart"
    super
  end

  def click_humburger_menu(key = nil)
    return find(:xpath, ta(@humburger_menu_ta)).click if key == :ep
    return find(:xpath, ta(@humburger_menu_il)).click if key == :il
    find(:xpath, ta(@humburger_menu_ta, @humburger_menu_il)).click
  end

  def click_signin_link(key = nil)
    return find(:xpath, ta(@signin_link_ep)).click if key == :ep
    return find(:xpath, ta(@signin_link_il)).click if key == :il
    find(:xpath, ta(@signin_link_ta, @signin_link_il)).click
  end

  def click_account_email(email, key = nil)
    return find(:xpath, ta(@account_email_ep)).click if key == :ep
    return find(:xpath, ta(@account_email_il)).click if key == :il
    find(:xpath, ta(@account_email_ta, @account_email_il)).set(email)
  end

  def click_pass (pass, key = nil)
    return find(:xpath, ta(@pass_ep)).set(pass) if key == :ep
    return find(:xpath, ta(@pass_il)).set(pass) if key == :il
    find(:xpath, ta(@pass_ta, @pass_il)).set(pass)
  end

  def click_signin_btn(key = nil)
    return find(:xpath, ta(@signin_btn_ep)).click if key == :ep
    return find(:xpath, ta(@signin_btn_il)).click if key == :il
    find(:xpath, ta(@signin_btn_ta, @signin_btn_il)).click
  end

  def click_logo(key = nil)
    return find(:xpath, ta(@logo_ep)).click if key == :ep
    return find(:xpath, ta(@logo_il)).click if key == :il
    find(:xpath, ta(@logo_ta, @logo_il)).click
  end

  def click_minicart(key = nil)
    return find(:xpath, ta(@minicart_ep)).click if key == :ep
    return find(:xpath, ta(@minicart_il)).click if key == :il
    find(:xpath, ta(@minicart_ta, @minicart_il)).click
  end

  def click_category_kids(key = nil)
    return find(:xpath, ta(@category_kids_ep)).click if key == :ep
    return find(:xpath, ta(@category_kids_il)).click if key == :il
    find(:xpath, ta(@category_kids_еф, @category_kids_il)).click
  end

  def click_subcategory_baby(key = nil)
    return find(:xpath, ta(@subcategory_baby_ep)).click if key == :ep
    return find(:xpath, ta(@subcategory_baby_il)).click if key == :il
    find(:xpath, ta(@subcategory_baby_ta, @subcategory_baby_il)).click
  end

  def click_subcategory_babygirl(key = nil)
    return find(:xpath, ta(@subcategory_babygirl_ep)).click if key == :ep
    return find(:xpath, ta(@subcategory_babygirl_il)).click if key == :il
    find(:xpath, ta(@subcategory_babygirl_ta, @subcategory_babygirl_il)).click
  end

  def click_girl_dress(key = nil)
    return find(:xpath, ta(@girl_dress_ep)).click if key == :ep
    return find(:xpath, ta(@girl_dress_il)).click if key == :il
    find(:xpath, ta(@girl_dress_ta, @girl_dress_il)).click
  end

  def click_pink_dress(key = nil)
    return find(:xpath, ta(@pink_dress_ep)).click if key == :ep
    return find(:xpath, ta(@pink_dress_il)).click if key == :il
    find(:xpath, ta(@pink_dress_ta, @pink_dress_il)).click
  end

  def click_baby_size(key = nil)
    return find(:xpath, ta(@baby_size_ep)).click if key == :ep
    return find(:xpath, ta(@baby_size_il)).click if key == :il
    find(:xpath, ta(@baby_size_ta, @baby_size_il)).click
  end

  def click_add_to_cart(key = nil)
    return find(:xpath, ta(@add_to_cart_ep)).click if key == :ep
    return find(:xpath, ta(@add_to_cart_il)).click if key == :il
    find(:xpath, ta(@add_to_cart_ta, @add_to_cart_il)).click
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


end