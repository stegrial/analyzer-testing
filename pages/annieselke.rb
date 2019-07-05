require 'capybara/rspec'
require 'selenium-webdriver'

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

  def login_btn(key = nil)
    return find(:xpath, ta(@login_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@login_btn_il)).click if key ==:il
    find(:xpath, ta(@login_btn_ta, @login_btn_il)).click
  end

  def create_acc(key = nil)
    return find(:xpath, ta(@create_acc_ep)).click if key ==:ep
    return find(:xpath, ta(@create_acc_il)).click if key ==:il
    find(:xpath, ta(@create_acc_ta, @create_acc_il)).click
  end

  def set_any_first_name(key = nil)
    return find(:xpath, ta(@first_name_ep)).set("name") if key ==:ep
    return find(:xpath, ta(@first_name_il)).set("name") if key ==:il
    find(:xpath, ta(@first_name_ta, @first_name_il)).set("name")
  end

  def set_any_last_name(key = nil)
    return find(:xpath, ta(@last_name_ep)).click if key ==:ep
    return find(:xpath, ta(@last_name_il)).click if key ==:il
    find(:xpath, ta(@last_name_ta, @last_name_il)).set("last_name")
  end

  def set_any_email(key = nil)
    return find(:xpath, ta(@email_ep)).set("youre.example@gmail.com") if key ==:ep
    return find(:xpath, ta(@email_il)).set("youre.example@gmail.com") if key ==:il
    find(:xpath, ta(@email_ta, @email_il)).set("youre.example@gmail.com")
  end

  def set_any_pass(key = nil)
    return find(:xpath, ta(@pass_ep)).set("pass") if key ==:ep
    return find(:xpath, ta(@pass_il)).set("pass") if key ==:il
    find(:xpath, ta(@pass_ta, @pass_il)).set("pass")
  end

  def check_any_pass(key = nil)
    return find(:xpath, ta(@check_pwd_ep)).set("pass") if key ==:ep
    return find(:xpath, ta(@check_pwd_il)).set("pass") if key ==:il
    find(:xpath, ta(@check_pwd_ta, @check_pwd_il)).set("pass")
  end

  def click_subscribe(key = nil)
    return find(:xpath, ta(@subscribe_ep)).click if key ==:ep
    return find(:xpath, ta(@subscribe_il)).click if key ==:il
    find(:xpath, ta(@subscribe_ta, @subscribe_il)).click
  end

  def click_register_btn(key = nil)
    return find(:xpath, ta(@register_ep)).click if key ==:ep
    return find(:xpath, ta(@register_il)).click if key ==:il
    find(:xpath, ta(@register_ta, @register_il)).click
  end

  def close_modal
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end

  end

end
