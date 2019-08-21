require 'spec_helper'

class Pinterest
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  EMAIL_IL = "//input[@name='id']"
  EMAIL_TA = "pinterest:email"
  EMAIL_EP = "EP:pinterest:email"

  PASSWORD_IL = "//input[@name='password']"
  PASSWORD_TA = "pinterest:pass"
  PASSWORD_EP = "EP:pinterest:pass"

  OK_BTN_IL = "//button[@class='red SignupButton active']"
  OK_BTN_TA = "pinterest:ok_btn"
  OK_BTN_EP = "EP:pinterest:ok_btn"

  SOME_PIN_IL = "(//a[@data-force-refresh])[4]"
  SOME_PIN_TA = "pinterest:some_pin"
  SOME_PIN_EP = "EP:pinterest:some_pin"

  SUBSCRIOTIONS_IL = "//div[@aria-label='Пины от пользователей, на которых вы подписаны']"
  SUBSCRIOTIONS_TA = "pinterest:subscriptions"
  SUBSCRIOTIONS_EP = "EP:pinterest:subscriptions"

  FIND_RECOMENDATION_IL = "(//button[@aria-label='Найдите людей, на которых можно подписаться'])[2]"
  FIND_RECOMENDATION_TA = "pinterest:find_recomendations"
  FIND_RECOMENDATION_EP = "EP:pinterest:find_recomendations"

  MORE_DROPDOWN_IL = "(//div[@role='button'])[9]"
  MORE_DROPDOWN_TA = "pinterest:more"
  MORE_DROPDOWN_EP = "EP:pinterest:more"

  TATTOO_IL = "//div[text()='Татуировки']"
  TATTOO_TA = "pinterest:tattoo"
  TATTOO_EP = "EP:pinterest:tattoo"

  FOURTH_CATEGORY_IL = "(//div[text()='Подписаться'])[4]"
  FOURTH_CATEGORY_TA = "pinterest:category"
  FOURTH_CATEGORY_EP = "EP:pinterest:category"

  def set_email(key = nil, email)
    return find(ta(EMAIL_EP)).set(email) if key == :ep
    return find(:xpath, EMAIL_IL).set(email) if key == :il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(email)
  end

  def set_password(key = nil, pass)
    return find( ta(PASSWORD_EP)).set(pass) if key == :ep
    return find(:xpath, PASSWORD_IL).set(pass) if key == :il
    find(:xpath, ta(PASSWORD_TA, PASSWORD_IL)).set(pass)
  end

  def click_ok_btn(key = nil)
    return find( ta(OK_BTN_EP)).click if key == :ep
    return find(:xpath, OK_BTN_IL).click if key == :il
    find(:xpath, ta(OK_BTN_TA, OK_BTN_IL)).click
  end

  def click_to_open_pin(key = nil)
    return find(ta(SOME_PIN_EP)).click if key == :ep
    return find(:xpath, SOME_PIN_IL).click if key == :il
    find(:xpath, ta(SOME_PIN_TA, SOME_PIN_IL)).click
  end

  def click_subscriptions(key = nil)
    return find( ta(SUBSCRIOTIONS_EP)).click if key == :ep
    return find(:xpath, SUBSCRIOTIONS_IL).click if key == :il
    find(:xpath, ta(SUBSCRIOTIONS_TA, SUBSCRIOTIONS_IL)).click
  end

  def click_to_find_recomendations(key = nil)
    return find(ta(FIND_RECOMENDATION_EP)).click if key == :ep
    return find(:xpath, FIND_RECOMENDATION_IL).click if key == :il
    find(:xpath, ta(FIND_RECOMENDATION_TA, FIND_RECOMENDATION_IL)).click
  end

  def click_to_look_more(key = nil)
    return find( ta(MORE_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, MORE_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(MORE_DROPDOWN_TA, MORE_DROPDOWN_IL)).click
  end

  def click_to_look_tattoo(key = nil)
    return find( ta(TATTOO_EP)).click if key == :ep
    return find(:xpath, TATTOO_IL).click if key == :il
    find(:xpath, ta(TATTOO_TA, TATTOO_IL)).click
  end

  def click_to_select_category(key = nil)
    return find( ta(FOURTH_CATEGORY_EP)).click if key == :ep
    return find(:xpath, FOURTH_CATEGORY_IL).click if key == :il
    find(:xpath, ta(FOURTH_CATEGORY_TA, FOURTH_CATEGORY_IL)).click
  end
end