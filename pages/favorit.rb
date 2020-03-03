require 'spec_helper'
require_relative 'page_extension'

class Favorit
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  SING_IN_BUTTON_IL = "//button[@class='but-blue-1 loginpagecl']"
  SING_IN_BUTTON_TA = "favorit:sign_in_button"
  SING_IN_BUTTON_EP = "EP:favorit:sign_in_button"

  PASS_IL = "//input[@id='password']"

  PASS_WITHOUT_SHOW_PASS_TA = "favorit:pass_without_show_pass"
  PASS_WITHOUT_SHOW_PASS_EP = "EP:favorit:pass_without_show_pass"

  PASS_WITH_SHOW_PASS_TA = "favorit:pass_with_show_pass"
  PASS_WITH_SHOW_PASS_EP = "EP:favorit:pass_with_show_pass"

  SHOW_PASS_BUTTON_IL = "//button[@class='show_password']"
  SHOW_PASS_BUTTON_TA = "favorit:show_pass_button"
  SHOW_PASS_BUTTON_EP = "EP:favorit:show_pass_button"

  def click_sing_in_button(key = nil)
    post_processing key do
      return find(:xpath, ta(SING_IN_BUTTON_EP)).click if key == :ep
      return find(:xpath, SING_IN_BUTTON_IL).click if key == :il
      find(:xpath, ta(SING_IN_BUTTON_TA, SING_IN_BUTTON_IL)).click
    end
  end

  def set_pass_with_show_pass(key = nil, pass)
    post_processing key do
      return find(:xpath, ta(PASS_WITH_SHOW_PASS_EP)).set(pass) if key == :ep
      return find(:xpath, PASS_IL).set(pass) if key == :il
      find(:xpath, ta(PASS_WITH_SHOW_PASS_TA, PASS_IL)).set(pass)
    end
  end

  def set_pass_without_show_pass(key = nil, pass)
    post_processing key do
      return find(:xpath, ta(PASS_WITHOUT_SHOW_PASS_EP)).set(pass) if key == :ep
      return find(:xpath, PASS_IL).set(pass) if key == :il
      find(:xpath, ta(PASS_WITHOUT_SHOW_PASS_TA, PASS_IL)).set(pass)
    end
  end

  def click_show_pass_button(key = nil)
    post_processing key do
      return find(:xpath, ta(SHOW_PASS_BUTTON_EP)).click if key == :ep
      return find(:xpath, SHOW_PASS_BUTTON_IL).click if key == :il
      find(:xpath, ta(SHOW_PASS_BUTTON_TA, SHOW_PASS_BUTTON_IL)).click
    end
  end

end