require 'capybara/rspec'
require 'selenium-webdriver'

module StageCom

  def initialize(*args)

    @humburger_menu_il = "//button[@id='nav-button']"
    @humburger_menu_ta = "stageCom:humburger_menu"
    @humburger_menu_ep = "EP:stageCom:humburger_menu"

    @signin_link_il = "//p[@class='m-menu__account__links']/a[text()='Sign in']"
    @signin_link_ta = "stageCom:signin_link"
    @signin_link_ep = "EP:stageCom:signin_link"

    @account_email_il = "//input[@id='email']"
    @account_email_ta = "stageCom:email"
    @account_email_ep = "EP:stageCom:email"

    @pass_il = "//input[@id='password']"
    @pass_ta = "stageCom:pass"
    @pass_ep = "EP:stageCom:pass"

    @signin_btn_il = "//input[@value='sign in']"
    @signin_btn_ta = "stageCom:sigin_btn"
    @signin_btn_ep = "EP:stageCom:sigin_btn"

    @logo_il = "//a[@class='m-header__logo']"
    @logo_ta = "stageCom:logo"
    @logo_ep = "EP:stageCom:logo"

    @minicart_il = "//a[@class='m-header__minicart m-header__miniCartInnerContent']"
    @minicart_ta = "stageCom:minicart"
    @minicart_ep = "EP:stageCom:minicart"
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
