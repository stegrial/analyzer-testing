require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module SportLife

  def initialize(*args)
    @russian_lang_il = "//a[contains(.,'рус')]"
    @ukraine_lang_il = "//a[contains(.,'укр')]"
    @russian_lang_ep = "EP:sport_life:rus_lang"
    @ukraine_lang_ep = "EP:sport_life:ukr_lang"
    super
  end

  def click_ukraine_lang_il
    find(:xpath, @ukraine_lang_il).click
  end

  def ep_click_russian_lang
    check_element_path @russian_lang_ep, @russian_lang_il
    find(:xpath, ta(@russian_lang_ep)).click
  end

  def ep_click_ukraine_lang
    check_element_path @ukraine_lang_ep, @ukraine_lang_il
    find(:xpath, ta(@ukraine_lang_ep)).click
  end

end