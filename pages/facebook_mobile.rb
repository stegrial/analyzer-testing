require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module FacebookMobile

  def initialize(*args)
    @email_il = "//input[@name='email']"
    @email_ta = "facebook:email"
    @email_ep = "EP:facebook:email"

    @pass_il = "//input[@name='pass']"
    @pass_ta = "facebook:pass"
    @pass_ep = "EP:facebook:pass"

    @login_btn_il = "//button[@data-sigil='touchable m_login_button']"
    @login_btn_ta = "facebook:login_btn"
    @login_btn_ep = "EP:facebook:login_btn"

    @ok_btn_il = "//button[@value='OK']"
    @ok_btn_ta = "facebook:ok_btn"
    @ok_btn_ep = "EP:facebook:ok_btn"

    @new_post_il = "//div[@role='textbox']"
    @new_post_ta = "facebook:newpost"
    @new_post_ep = "EP:facebook:newpost"

    @set_text_il = "//textarea[@class='composerInput mentions-input']"
    @set_text_ta = "facebook:set_text"
    @set_text_ep = "EP:facebook:set_text"

    @post_btn_il = "//button[@value='Post']"
    @post_btn_ta = "facebook:post_btn"
    @post_btn_ep = "EP:facebook:post_btn"

    @multi_menu_btn_il = "(//a[@data-sigil='touchable'])[1]"
    @multi_menu_btn_ta = "facebook:multi_menu_btn"
    @multi_menu_btn_ep = "EP:facebook:multi_menu_btn"

    @delete_post_il = "//a[@data-sigil='touchable touchable removeStoryButton enabled_action']"
    @delete_post_ta = "facebook:delete_post"
    @delete_post_ep = "EP:facebook:delete_post"

    @confirm_delete_il = "//a[@title='Delete']"
    @confirm_delete_ta = "facebook:accept_delete"
    @confirm_delete_ep = "EP:facebook:accept_delete"

    super
  end

  def set_email(login)
    find(:xpath, ta(@email_ta, @email_il)).set(login)
  end

  def set_pass (pass)
    find(:xpath, ta(@pass_ta, @pass_il)).set(pass)
  end

  def click_login_btn
    find(:xpath, ta(@login_btn_ta, @login_btn_il)).click
  end

  def click_ok_btn
    find(:xpath, ta(@ok_btn_ta, @ok_btn_il)).click
  end

  def check_ok_btn
    check_element_path @ok_btn_ta, @ok_btn_il
  end

  def click_new_post
    find(:xpath, ta(@new_post_ta, @new_post_il)).click
  end

  def add_text_in_post (text)
    find(:xpath, ta(@set_text_ta, @set_text_il)).set(text)
  end

  def expect_publishing
    expect(page).to have_text("Your post is now published")
    expect(page).to have_no_text("Your post is now published")
  end

  def click_post_btn
    find(:xpath, ta(@post_btn_ta, @post_btn_il)).click
  end

  def click_multi_menu
    find(:xpath, ta(@multi_menu_btn_ta, @multi_menu_btn_il)).click
  end

  def deleting_post
    find(:xpath, ta(@delete_post_ta, @delete_post_il)).click
  end

  def confirm_delete
    find(:xpath, ta(@confirm_delete_ta, @confirm_delete_il)).click
  end



  def ep_set_email (login)
    check_element_path @email_ep, @email_il
    find(:xpath, ta(@email_ep)).set(login)
  end

  def ep_set_pass (pass)
    check_element_path @pass_ep, @pass_il
    find(:xpath, ta(@pass_ep)).set(pass)
  end

  def ep_click_login_btn
    check_element_path @login_btn_ep, @login_btn_il
    find(:xpath, ta(@login_btn_ep)).click
  end

  def ep_click_ok_btn
    check_element_path @ok_btn_ep, @ok_btn_il
    find(:xpath, ta(@ok_btn_ep)).click
  end

  def ep_click_new_post
    check_element_path @new_post_ep, @new_post_il
    find(:xpath, ta(@new_post_ep)).click
  end

  def ep_add_text_in_post (text)
    check_element_path @set_text_ep, @set_text_il
    find(:xpath, ta(@set_text_ep)).set(text)
  end

  def ep_click_post_btn
    check_element_path @post_btn_ep, @post_btn_il
    find(:xpath, ta(@post_btn_ep)).click
  end

  def ep_click_multi_menu
    # check_element_path @multi_menu_btn_ep, @multi_menu_btn_il
    find(:xpath, ta(@multi_menu_btn_ep)).click
  end

  def ep_click_delete_post
    check_element_path @delete_post_ep, @delete_post_il
    find(:xpath, ta(@delete_post_ep)).click
  end

  def ep_confirm_delete_post
    check_element_path @confirm_delete_ep, @confirm_delete_il
    find(:xpath, ta(@confirm_delete_ep)).click
  end
end
