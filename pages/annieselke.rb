require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module AnnieSelke

  def initialize(*args)
    @login_btn_il = "(//a[text()='Login'])[1]"
    @login_btn_ta = "annieselke:login_btn"
    @login_btn_ep = "EP:annieselke:login_btn"

    @create_acc_il = "//h3[text()='Create an Account']"
    @create_acc_ta = "annieselke:create_acc"
    @create_acc_ep = "EP:annieselke:create_acc"

    @first_name_il = "//input[@name='firstName']"
    @first_name_ta = "annieselke:first_name"
    @first_name_ep = "EP:annieselke:first_name"

    @last_name_il = "//input[@name='lastName']"
    @last_name_ta = "annieselke:last_name"
    @last_name_ep = "EP:annieselke:last_name"

    @email_il = "//input[@name='email']"
    @email_ta = "annieselke:email"
    @email_ep = "EP:annieselke:email"

    @pass_il = "//input[@id='password']"
    @pass_ta = "annieselke:pass"
    @pass_ep = "EP:annieselke:pass"

    @check_pwd_il = "//input[@id='register.checkPwd']"
    @check_pwd_ta = "annieselke:check_pwd"
    @check_pwd_ep = "EP:annieselke:check_pwd"

    @subscribe_il = "//label[@for='subscribe']"
    @subscribe_ta = "annieselke:subscribe"
    @subscribe_ep = "EP:annieselke:subscribe"

    @register_il = "(//button[@class='primary actionSet'])[2]"
    @register_ta = "annieselke:register"
    @register_ep = "EP:annieselke:register"

    super
  end

  def login_btn
    find(:xpath, ta(@login_btn_ta, @login_btn_il)).click
  end

  def create_acc
    find(:xpath, ta(@create_acc_ta, @create_acc_il)).click
  end

  def set_any_first_name
    find(:xpath, ta(@first_name_ta, @first_name_il)).set("name")
  end

  def set_any_last_name
    find(:xpath, ta(@last_name_ta, @last_name_il)).set("last_name")
  end

  def set_any_email
    find(:xpath, ta(@email_ta, @email_il)).set("youre.example@gmail.com")
  end

  def set_any_pass
    find(:xpath, ta(@pass_ta, @pass_il)).set("pass")
  end

  def check_any_pass
    find(:xpath, ta(@check_pwd_ta, @check_pwd_il)).set("pass")
  end

  def click_subscribe
    find(:xpath, ta(@subscribe_ta, @subscribe_il)).click
  end

  def click_register_btn
    find(:xpath, ta(@register_ta, @register_il)).click
  end



  def ep_login_btn
    check_element_path @login_btn_ep, @login_btn_il
    find(:xpath, ta(@login_btn_ep)).click
  end

  def ep_create_acc
    check_element_path @create_acc_ep, @create_acc_il
    find(:xpath, ta(@create_acc_ep)).click
  end

  def ep_set_any_first_name
    check_element_path @first_name_ep, @first_name_il
    find(:xpath, ta(@first_name_ep)).set("name")
  end

  def ep_set_any_last_name
    check_element_path @last_name_ep, @last_name_il
    find(:xpath, ta(@last_name_ep)).set("last_name")
  end

  def ep_set_any_email
    check_element_path @email_ep, @email_il
    find(:xpath, ta(@email_ep)).set("youre.example@gmail.com")
  end

  def ep_set_any_pass
    check_element_path @pass_ep, @pass_il
    find(:xpath, ta(@pass_ep)).set("pass")
  end

  def ep_check_any_pass
    check_element_path @check_pwd_ep, @check_pwd_il
    find(:xpath, ta(@check_pwd_ep)).set("pass")
  end

  def ep_click_subscribe
    check_element_path @subscribe_ep, @subscribe_il
    find(:xpath, ta(@subscribe_ep)).click
  end

  def ep_click_register_btn
    check_element_path @register_ep, @register_il
    find(:xpath, ta(@register_ep)).click
  end


  def close_modal
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

  end

end
