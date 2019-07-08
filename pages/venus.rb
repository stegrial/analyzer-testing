require 'capybara/rspec'
require 'selenium-webdriver'

module Venus

  def initialize(*args)
    @account_button_il = "(//button[@aria-label='Account'])[1]"
    @account_button_ta = 'venus:account_button'
    @account_button_ep = 'EP:venus:account_button'

    @email_field_il = 'ctl00_Body1_loginemail'
    @email_field_ta = 'venus:email_field'
    @email_field_ep = 'EP:venus:email_field'

    @pass_field_il = 'ctl00_Body1_loginpassword'
    @pass_field_ta = 'venus:pass_field'
    @pass_field_ep = 'EP:venus:pass_field'

    @sign_in_btn_il = 'ctl00_Body1_loginbutton'
    @sign_in_btn_ta = 'venus:sign_in_btn'
    @sign_in_btn_ep = 'EP:venus:sign_in_btn'

    @mail_options_il = "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]"
    @mail_options_ta = 'venus:account_menu:mail_options'
    @mail_options_ep = 'EP:venus:account_menu:mail_options'
    super
  end

  def click_account_button(key = nil)
    return find(:xpath, ta(@account_button_ep)).click if key == :ep
    return find(:xpath, @account_button_il).click if key == :il
    find(:xpath, ta(@account_button_ta, @account_button_il)).click
  end

  def fill_email_field(key = nil, email)
    return find(:id, ta(@email_field_ep)).set(email) if key == :ep
    return find(:id, @email_field_il).set(email) if key == :il
    find(:id, ta(@email_field_ta, @email_field_il)).set(email)
  end

  def fill_pass_field(key = nil, pass)
    return find(:id, ta(@pass_field_ep)).set(pass) if key == :ep
    return find(:id, @pass_field_il).set(pass) if key == :il
    find(:id, ta(@pass_field_ta, @pass_field_il)).set(pass)
  end

  def click_sign_in_button(key = nil)
    return find(:id, ta(@sign_in_btn_ep)).click if key == :ep
    return find(:id, @sign_in_btn_il).click if key == :il
    find(:id, ta(@sign_in_btn_ta, @sign_in_btn_il)).click
  end

  def click_mail_options(key = nil)
    return find(:xpath, ta(@mail_options_ep)).click if key == :ep
    return find(:xpath, @mail_options_il).click if key == :il
    find(:xpath, ta(@mail_options_ta, @mail_options_il)).click
  end

end
