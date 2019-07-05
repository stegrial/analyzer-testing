require 'capybara/rspec'
require 'selenium-webdriver'

module FacebookMobile

  def initialize(*args)
    @email_il = "//input[@name='email']"
    @email_ta = "facebook_mobile:email"
    @email_ep = "EP:facebook_mobile:email"

    @pass_il = "//input[@name='pass']"
    @pass_ta = "facebook_mobile:pass"
    @pass_ep = "EP:facebook_mobile:pass"

    @login_btn_il = "//button[@data-sigil='touchable m_login_button']"
    @login_btn_ta = "facebook_mobile:login_btn"
    @login_btn_ep = "EP:facebook_mobile:login_btn"

    @ok_btn_il = "//button[@value='OK']"
    @ok_btn_ta = "facebook_mobile:ok_btn"
    @ok_btn_ep = "EP:facebook_mobile:ok_btn"

    @new_post_il = "//div[@role='textbox']"
    @new_post_ta = "facebook_mobile:newpost"
    @new_post_ep = "EP:facebook_mobile:newpost"

    @set_text_il = "//textarea[@class='composerInput mentions-input']"
    @set_text_ta = "facebook_mobile:set_text"
    @set_text_ep = "EP:facebook_mobile:set_text"

    @post_btn_il = "//button[@value='Post']"
    @post_btn_ta = "facebook_mobile:post_btn"
    @post_btn_ep = "EP:facebook_mobile:post_btn"

    @multi_menu_btn_il = "(//a[@data-sigil='touchable'])[1]"
    @multi_menu_btn_ta = "facebook_mobile:multi_menu_btn"
    @multi_menu_btn_ep = "EP:facebook_mobile:multi_menu_btn"

    @delete_post_il = "//a[@data-sigil='touchable touchable removeStoryButton enabled_action']"
    @delete_post_ta = "facebook_mobile:delete_post"
    @delete_post_ep = "EP:facebook_mobile:delete_post"

    @confirm_delete_il = "//a[@title='Delete']"
    @confirm_delete_ta = "facebook_mobile:accept_delete"
    @confirm_delete_ep = "EP:facebook_mobile:accept_delete"

    super
  end

  def set_email(login, key = nil)
    return find(:xpath, ta(@email_ep)).set(login) if key ==:ep
    return find(:xpath, ta(@email_il)).set(login) if key ==:il
    find(:xpath, ta(@email_ta, @email_il)).set(login)
  end

  def set_pass (pass, key = nil)
    return find(:xpath, ta(@pass_ep)).set(pass) if key ==:ep
    return find(:xpath, ta(@pass_il)).set(pass) if key ==:il
    find(:xpath, ta(@pass_ta, @pass_il)).set(pass)
  end

  def click_login_btn(key = nil)
    return find(:xpath, ta(@login_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@login_btn_il)).click if key ==:il
    find(:xpath, ta(@login_btn_ta, @login_btn_il)).click
  end

  def click_ok_btn(key = nil)
    return find(:xpath, ta(@ok_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@ok_btn_il)).click if key ==:il
    find(:xpath, ta(@ok_btn_ta, @ok_btn_il)).click
  end

  def click_new_post(key = nil)
    return find(:xpath, ta(@new_post_ep)).click if key ==:ep
    return find(:xpath, ta(@new_post_il)).click if key ==:il
    find(:xpath, ta(@new_post_ta, @new_post_il)).click
  end

  def add_text_in_post(key = nil)
    return find(:xpath, ta(@set_text_ep)).set('text') if key ==:ep
    return find(:xpath, ta(@set_text_il)).set('text') if key ==:il
    find(:xpath, ta(@set_text_ta, @set_text_il)).set('text')
  end

  def expect_publishing
    expect(page).to have_text("Your post is now published")
    expect(page).to have_no_text("Your post is now published")
  end

  def click_post_btn(key = nil)
    return find(:xpath, ta(@post_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@post_btn_il)).click if key ==:il
    find(:xpath, ta(@post_btn_ta, @post_btn_il)).click
  end

  def click_multi_menu(key = nil)
    return find(:xpath, ta(@multi_menu_btn_ep)).click if key ==:ep
    return find(:xpath, ta(@multi_menu_btn_il)).click if key ==:il
    find(:xpath, ta(@multi_menu_btn_ta, @multi_menu_btn_il)).click
  end

  def deleting_post(key = nil)
    return find(:xpath, ta(@delete_post_ep)).click if key ==:ep
    return find(:xpath, ta(@delete_post_il)).click if key ==:il
    find(:xpath, ta(@delete_post_ta, @delete_post_il)).click
  end

  def confirm_delete(key = nil)
    return find(:xpath, ta(@confirm_delete_ep)).click if key ==:ep
    return find(:xpath, ta(@confirm_delete_il)).click if key ==:il
    find(:xpath, ta(@confirm_delete_ta, @confirm_delete_il)).click
  end

end