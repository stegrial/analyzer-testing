require 'capybara/rspec'
require 'selenium-webdriver'


module AnnieSelkeMobile

  def initialize(*args)
    @login_btn_il = "(//a[text()='Login'])[1]"
    @login_btn_ta = "annieselke_mobile:login_btn"
    @login_btn_ep = "EP:annieselke_mobile:login_btn"

    @email_il = "//input[@id='j_username']"
    @email_ta = "annieselke_mobile:email"
    @email_ep = "EP:annieselke_mobile:email"

    @pass_il = "//input[@id='j_password']"
    @pass_ta = "annieselke_mobile:pass"
    @pass_ep = "EP:annieselke_mobile:pass"

    @login_il = "(//button[@class='primary'])[1]"
    @login_ta = "annieselke_mobile:register"
    @login_ep = "EP:annieselke_mobile:register"

    @humburger_menu_il = "//button[@aria-label='Menu']"
    @humburger_menu_ta = "annieselke_mobile:humburger_menu"
    @humburger_menu_ep = "EP:annieselke_mobile:humburger_menu"

    @myAccount_il = "//a[text()='My Account']"
    @myAccount_ta = "annieselke_mobile:my_account"
    @myAccount_ep = "EP:annieselke_mobile:my_account"

    @personal_deteils_il = "//a[text()='Update personal details']"
    @personal_deteils_ta = "annieselke_mobile:personal_details"
    @personal_deteils_ep = "EP:annieselke_mobile:personal_details"

    @gender_il = "//select[@id='profile.title']"
    @gender_ta = "annieselke_mobile:gender"
    @gender_ep = "EP:annieselke_mobile:gender"

    @save_btn_il = "//button[text()='Save Updates']"
    @save_btn_ta = "annieselke_mobile:save_btn"
    @save_btn_ep = "EP:annieselke_mobile:save_btn"

    super
  end

  def login_btn(key = nil)
    return find(:xpath, ta(@login_btn_ep)).click if  key ==:ep
    return find(:xpath, ta(@login_btn_il)).click if  key ==:il
    find(:xpath, ta(@login_btn_ta, @login_btn_il)).click
  end

  def set_email(key = nil)
    return find(:xpath, ta(@email_ep)).set("julia.arapova@softesis.com") if key ==:ep
    return find(:xpath, ta(@email_il)).set("julia.arapova@softesis.com") if key ==:il
    find(:xpath, ta(@email_ta, @email_il)).set("julia.arapova@softesis.com")
  end

  def set_pass(key = nil)
    return find(:xpath, ta(@pass_ep)).set("1234tesT") if key ==:ep
    return find(:xpath, ta(@pass_il)).set("1234tesT") if key ==:il
    find(:xpath, ta(@pass_ta, @pass_il)).set("1234tesT")
  end

  def click_login_btn(key = nil)
    return find(:xpath, ta(@login_ep)).click if key ==:ep
    return find(:xpath, ta(@login_il)).click if key ==:il
    find(:xpath, ta(@login_ta, @login_il)).click
  end

  def click_humburger_menu(key = nil)
    return find(:xpath, ta(@humburger_menu_ep)).click if key ==:ep
    return find(:xpath, ta(@humburger_menu_il)).click if key ==:il
    find(:xpath, ta(@humburger_menu_ta, @humburger_menu_il)).click
  end

  def click_my_acc_btn(key = nil)
    return find(:xpath, ta(@myAccount_ep)).click if key ==:ep
    return find(:xpath, ta(@myAccount_il)).click if key ==:il
    find(:xpath, ta(@myAccount_ta, @myAccount_il)).click
  end

  def click_personal_info_btn(key = nil)
    return find(:xpath, ta(@personal_deteils_ep)).click if key ==:ep
    return find(:xpath, ta(@personal_deteils_il)).click if key ==:il
    find(:xpath, ta(@personal_deteils_ta, @personal_deteils_il)).click
  end

  def select_gender(key = nil)
    return find(:xpath, ta(@gender_ep)).select('Ms') if key ==:ep
    return find(:xpath, ta(@gender_il)).select('Ms') if key ==:il
    find(:xpath, ta(@gender_ta, @gender_il)).select('Ms')
  end

  def click_save_btn(key = nil)
    return find(:xpath, ta(@save_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@save_btn_il)).click if key ==:il
    find(:xpath, ta(@save_btn_ta, @save_btn_il)).click
  end

  def close_modal
    if page.has_xpath?("//iframe[@title='Sign up for 15% Off!']")
      within_frame(1) do
        find(:xpath, "//button[@title='Close Dialog']").click
      end
    end
  end
end
