require 'spec_helper'

class Ecflow

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  LOGIN_IL = "//input[@id='username']"
  LOGIN_TA = "ec_flow:login"
  LOGIN_EP = "EP:ec_flow:login"

  PASSWORD_IL = "//input[@id='password']"
  PASSWORD_TA = "ec_flow:password"
  PASSWORD_EP = "EP:ec_flow:password"

  LOGIN_BTN_IL = "//button[text()='Login']"
  LOGIN_BTN_TA = "ec_flow:login_bth"
  LOGIN_BTN_EP = "EP:ec_flow:login_btn"

  HUMBURG_BTN_IL = "//div[@class='at-main-menu-btn ch-icon-container menu']"
  HUMBURG_BTN_TA = "ec_flow:humburg"
  HUMBURG_BTN_EP = "EP:ec_flow:humburg"

  PIPELINES_IL = "//a[@class='black-link nav-menu-category__item at-main-menu-pipelines']"
  PIPELINES_TA = "ec_flow:pipelines"
  PIPELINES_EP = "EP:ec_flow:pipelines"

  CHOOSE_PIPELINE_IL = "//div/a[@title='pipJul_NOT_DELETE']"
  CHOOSE_PIPELINE_TA = "ec_flow:choose_pipeline"
  CHOOSE_PIPELINE_EP = "EP:ec_flow:choose_pipeline"


  def set_login(key = nil,login)
    return find(:xpath, ta(LOGIN_EP)).set(login) if key ==:ep
    return find(:xpath, ta(LOGIN_IL)).set(login) if key ==:il
    find(:xpath, ta(LOGIN_TA, LOGIN_IL)).set(login)
  end

  def set_password(key = nil,pass)
    return find(:xpath, ta(PASSWORD_EP)).set(pass) if key ==:ep
    return find(:xpath, ta(PASSWORD_IL)).set(pass) if key ==:il
    find(:xpath, ta(PASSWORD_TA, PASSWORD_IL)).set(pass)
  end

  def click_login_btn(key = nil)
    return find(:xpath, ta(LOGIN_BTN_EP)).click() if key ==:ep
    return find(:xpath, ta(LOGIN_BTN_IL)).click() if key ==:il
    find(:xpath, ta(LOGIN_BTN_TA, LOGIN_BTN_IL)).click()
  end

  def click_humburg_btn(key = nil)
    return find(:xpath, ta(HUMBURG_BTN_EP)).click() if key ==:ep
    return find(:xpath, ta(HUMBURG_BTN_IL)).click() if key ==:il
    find(:xpath, ta(HUMBURG_BTN_TA, HUMBURG_BTN_IL)).click()
  end

  def click_pipelines(key = nil)
    return find(:xpath, ta(PIPELINES_EP)).click() if key ==:ep
    return find(:xpath, ta(PIPELINES_IL)).click() if key ==:il
    find(:xpath, ta(PIPELINES_TA, PIPELINES_IL)).click()
  end

  def choose_pipeline_from_list(key = nil)
    return find(:xpath, ta(CHOOSE_PIPELINE_EP)).click() if key ==:ep
    return find(:xpath, ta(CHOOSE_PIPELINE_IL)).click() if key ==:il
    find(:xpath, ta(CHOOSE_PIPELINE_TA, CHOOSE_PIPELINE_IL)).click()
  end
end