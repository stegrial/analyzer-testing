require 'spec_helper'

class Epicgames

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  LOGO_IL = "a.shieldLogo"
  LOGO_TA = "epicgames:logo"
  LOGO_EP = "EP:epicgames:logo"

  SHOP_LINK_IN_HEADER_IL = "li#sitenav-link-0"
  SHOP_LINK_IN_HEADER_TA = "epicgames:nav_menu:shop"
  SHOP_LINK_IN_HEADER_EP = "EP:epicgames:nav_menu:shop"

  NEWS_IN_HEADER_IL = "li#sitenav-link-1"
  NEWS_IN_HEADER_TA = "epicgames:nav_menu:news"
  NEWS_IN_HEADER_EP = "EP:epicgames:nav_menu:news"

  HELP_IN_HEADER_IL = "li#sitenav-link-2"
  HELP_IN_HEADER_TA = "epicgames:nav_menu:help"
  HELP_IN_HEADER_EP = "EP:epicgames:nav_menu:help"

  UNREAL_ENGINE_IN_HEADER_IL = "li#sitenav-link-3"
  UNREAL_ENGINE_IN_HEADER_TA = "epicgames:nav_menu:unrealEngine"
  UNREAL_ENGINE_IN_HEADER_EP = "EP:epicgames:nav_menu:unrealEngine"

  SLIDER_RIGHT_ARROW_IL = "(//div[@class='slick-arrow slick-next'])[1]"
  SLIDER_RIGHT_ARROW_TA = "epicgames:slider_arrow_right"
  SLIDER_RIGHT_ARROW_EP = "EP:epicgames:slider_arrow_right"

  LATEST_NEWS_IL = "a#overviewRibbon"
  LATEST_NEWS_TA = "epicgames:latest_news_btn"
  LATEST_NEWS_EP = "EP:epicgames:latest_news_btn"

  SIGN_IN_IL = "//span[@class='sign-text item-label display-name text-color']"
  SIGN_IN_TA = "epicgames:sign_in"
  SIGN_IN_EP = "EP:epicgames:sign_in"

  SIGN_UP_IL = "a#switchPageAction"
  SIGN_UP_TA = "epicgames:sign_up"
  SIGN_UP_EP = "EP:epicgames:sign_up"

  FIRST_NAME_IL = "input#name"
  FIRST_NAME_TA = "epicgames:first_name"
  FIRST_NAME_EP = "EP:epicgames:first_name"

  LAST_NAME_IL = "input#lastName"
  LAST_NAME_TA = "epicgames:last_name"
  LAST_NAME_EP = "EP:epicgames:last_name"

  DISPLAY_NAME_IL = "input#displayName"
  DISPLAY_NAME_TA = "epicgames:display_name"
  DISPLAY_NAME_EP = "EP:epicgames:display_name"

  EMAIL_IL = "input#email"
  EMAIL_TA = "epicgames:email"
  EMAIL_EP = "EP:epicgames:email"

  PASSWORD_IL = "input#password"
  PASSWORD_TA = "epicgames:password"
  PASSWORD_EP = "EP:epicgames:password"

  EMAIL_SUBSCRIBE_IL = "div.mailSubscribe"
  EMAIL_SUBSCRIBE_TA = "epicgames:email_subscribe"
  EMAIL_SUBSCRIBE_EP = "EP:epicgames:email_subscribe"

  TERMS_AGREE_IL = "div.termsAgree"
  TERMS_AGREE_TA = "epicgames:terms_agree"
  TERMS_AGREE_EP = "EP:epicgames:terms_agree"

  REGISTER_NEW_ACC_IL = "input#register"
  REGISTER_NEW_ACC_TA = "epicgames:registr"
  REGISTER_NEW_ACC_EP = "EP:epicgames:register"

  ROBOT_ERROR = "//label[text()='You must complete the captcha.']"

  def click_logo(key = nil)
    return find(ta(LOGO_EP)).click if key ==:ep
    return find(:css, LOGO_IL).click if key ==:il
    find(:css, ta(LOGO_TA, LOGO_IL)).click
  end

  def click_shop_link(key = nil)
    return find(ta(SHOP_LINK_IN_HEADER_EP)).click if key ==:ep
    return find(:css, SHOP_LINK_IN_HEADER_IL).click if key ==:il
    find(:css, ta(SHOP_LINK_IN_HEADER_TA, SHOP_LINK_IN_HEADER_IL)).click
  end

  def click_news_link(key = nil)
    return find(ta(NEWS_IN_HEADER_EP)).click if key ==:ep
    return find(:css, NEWS_IN_HEADER_IL).click if key ==:il
    find(:css, ta(NEWS_IN_HEADER_TA, NEWS_IN_HEADER_IL)).click
  end

  def click_help_link(key = nil)
    return find(ta(HELP_IN_HEADER_EP)).click if key ==:ep
    return find(:css, HELP_IN_HEADER_IL).click if key ==:il
    find(:css, ta(HELP_IN_HEADER_TA, HELP_IN_HEADER_IL)).click
  end

  def click_unreal_engine_link(key = nil)
    return find(ta(UNREAL_ENGINE_IN_HEADER_EP)).click if key ==:ep
    return find(:css, UNREAL_ENGINE_IN_HEADER_IL).click if key ==:il
    find(:css, ta(UNREAL_ENGINE_IN_HEADER_TA, UNREAL_ENGINE_IN_HEADER_IL)).click
  end

  def click_slider_right_link_arrow(key = nil)
    return find(ta(SLIDER_RIGHT_ARROW_EP)).click if key ==:ep
    return find(:xpath, SLIDER_RIGHT_ARROW_IL).click if key ==:il
    find(:xpath, ta(SLIDER_RIGHT_ARROW_TA, SLIDER_RIGHT_ARROW_IL)).click
  end

  def click_latest_news(key = nil)
    return find(ta(LATEST_NEWS_EP)).click if key ==:ep
    return find(:css, LATEST_NEWS_IL).click if key ==:il
    find(:css, ta(LATEST_NEWS_TA, LATEST_NEWS_IL)).click
  end

  def click_sign_in(key = nil)
    return find(ta(SIGN_IN_EP)).click if key ==:ep
    return find(:xpath, SIGN_IN_IL).click if key ==:il
    find(:xpath, ta(SIGN_IN_TA, SIGN_IN_IL)).click
  end

  def click_sign_up(key = nil)
    return find(ta(SIGN_UP_EP)).click if key ==:ep
    return find(:css, SIGN_UP_IL).click if key ==:il
    find(:css, ta(SIGN_UP_TA, SIGN_UP_IL)).click
  end

  def set_first_name(key = nil, firstName)
    return find(ta(FIRST_NAME_EP)).set(firstName) if key ==:ep
    return find(:css, FIRST_NAME_IL).set(firstName) if key ==:il
    find(:css, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set(firstName)
  end

  def set_last_name(key = nil, lastName)
    return find(ta(LAST_NAME_EP)).set(lastName) if key ==:ep
    return find(:css, LAST_NAME_IL).set(lastName) if key ==:il
    find(:css, ta(LAST_NAME_TA, LAST_NAME_IL)).set(lastName)
  end

  def set_display_name(key = nil, displayName)
    return find(ta(DISPLAY_NAME_EP)).set(displayName) if key ==:ep
    return find(:css, DISPLAY_NAME_IL).set(displayName) if key ==:il
    find(:css, ta(DISPLAY_NAME_TA, DISPLAY_NAME_IL)).set(displayName)
  end

  def set_email(key = nil, email)
    return find(ta(EMAIL_EP)).set(email) if key ==:ep
    return find(:css, EMAIL_IL).set(email) if key ==:il
    find(:css, ta(EMAIL_TA, EMAIL_IL)).set(email)
  end

  def set_password(key = nil, pass)
    return find(ta(PASSWORD_EP)).set(pass) if key ==:ep
    return find(:css, PASSWORD_IL).set(pass) if key ==:il
    find(:css, ta(PASSWORD_TA, PASSWORD_IL)).set(pass)
  end

  def click_email_subscribe(key = nil)
    return find(ta(EMAIL_SUBSCRIBE_EP)).click if key ==:ep
    return find(:css, EMAIL_SUBSCRIBE_IL).click if key ==:il
    find(:css, ta(EMAIL_SUBSCRIBE_TA, EMAIL_SUBSCRIBE_IL)).click
  end

  def click_terms_agree(key = nil)
    return find(ta(TERMS_AGREE_EP)).click if key ==:ep
    return find(:css, TERMS_AGREE_IL).click if key ==:il
    find(:css, ta(TERMS_AGREE_TA, TERMS_AGREE_IL)).click
  end

  def click_register_acc(key = nil)
    return find(ta(REGISTER_NEW_ACC_EP)).click if key ==:ep
    return find(:css, REGISTER_NEW_ACC_IL).click if key ==:il
    find(:css, ta(REGISTER_NEW_ACC_TA, REGISTER_NEW_ACC_IL)).click
  end

  def click_not_a_robot(key = nil)
    return find(ta(NOT_ROBOT_EP)).click if key ==:ep
    return find(:css, NOT_ROBOT_IL).click if key ==:il
    find(:css, ta(NOT_ROBOT_TA, NOT_ROBOT_IL)).click
  end
end