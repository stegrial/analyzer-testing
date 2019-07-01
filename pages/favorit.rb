require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module Favorit

  def initialize(*args)
    @sign_in_button_il = "//button[@class='but-blue-1 loginpagecl']"
    @sign_in_button_ta = "favorit:sign_in_button"
    @sign_in_button_ep = "EP:favorit:sign_in_button"

    @pass_il = "//input[@id='password']"

    @pass_without_show_pass_ta = "favorit:pass_without_show_pass"
    @pass_without_show_pass_ep = "EP:favorit:pass_without_show_pass"

    @pass_with_show_pass_ta = "favorit:pass_with_show_pass"
    @pass_with_show_pass_ep = "EP:favorit:pass_with_show_pass"

    @show_pass_button_il = "//button[@class='show_password']"
    @show_pass_button_ta = "favorit:show_pass_button"
    @show_pass_button_ep = "EP:favorit:show_pass_button"
    super
  end

  def click_sing_in_button_il
    find(:xpath, @sign_in_button_il).click
  end

  def click_sing_in_button
    find(:xpath, ta(@sign_in_button_ta, @sign_in_button_il)).click
  end

  def check_sign_in_button
    check_element_path @sign_in_button_ta, @sign_in_button_il
  end

  def ep_click_sign_in_button
    check_element_path @sign_in_button_ep, @sign_in_button_il
    find(:xpath, ta(@sign_in_button_ep)).click
  end

  def set_pass_with_show_pass (pass)
    find(:xpath, ta(@pass_with_show_pass_ta, @pass_il)).set(pass)
  end

  def check_pass_with_show_pass
    check_element_path @pass_with_show_pass_ta, @pass_il
  end

  def ep_set_pass_with_show_pass (pass)
    check_element_path @pass_with_show_pass_ep, @pass_il
    find(:xpath, ta(@pass_with_show_pass_ep)).set(pass)
  end

  def set_pass_without_show_pass (pass)
    find(:xpath, ta(@pass_without_show_pass_ta, @pass_il)).set(pass)
  end

  def check_pass_without_show_pass
    check_element_path @pass_without_show_pass_ta, @pass_il
  end

  def ep_set_pass_without_show_pass (pass)
    check_element_path @pass_without_show_pass_ep, @pass_il
    find(:xpath, ta(@pass_without_show_pass_ep)).set(pass)
  end

  def click_show_pass_button_il
    find(:xpath, @show_pass_button_il).click
  end

  def click_show_pass_button
    find(:xpath, ta(@show_pass_button_ta, @show_pass_button_il)).click
  end

  def check_show_pass_button
    check_element_path @show_pass_button_ta, @show_pass_button_il
  end

  def ep_click_show_pass_button
    check_element_path @show_pass_button_ep, @show_pass_button_il
    find(:xpath, ta(@show_pass_button_ep)).click
  end



end