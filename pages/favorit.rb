require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

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

  def click_sing_in_button(key = nil)
    return find(:xpath, ta(@sign_in_button_ep)).click if key == :ep
    return find(:xpath, @sign_in_button_il).click if key == :il
    find(:xpath, ta(@sign_in_button_ta, @sign_in_button_il)).click
  end

  def set_pass_with_show_pass(pass, key = nil)
    return find(:xpath, ta(@pass_with_show_pass_ep)).set(pass) if key == :ep
    return find(:xpath, @pass_il).set(pass) if key == :il
    find(:id, ta(@pass_with_show_pass_ta, @pass_il)).set(pass)
  end

  def set_pass_without_show_pass(pass, key = nil)
    return find(:xpath, ta(@pass_without_show_pass_ep)).set(pass) if key == :ep
    return find(:xpath, @pass_il).set(pass) if key == :il
    find(:id, ta(@pass_without_show_pass_ta, @pass_il)).set(pass)
  end

  def click_show_pass_button(key = nil)
    return find(:xpath, ta(@show_pass_button_ep)).click if key == :ep
    return find(:xpath, @show_pass_button_il).click if key == :il
    find(:xpath, ta(@show_pass_button_ta, @show_pass_button_il)).click
  end

end