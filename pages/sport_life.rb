require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

module SportLife

  def initialize(*args)
    @russian_lang_il = "//a[contains(.,'рус')]"
    @ukraine_lang_il = "//a[contains(.,'укр')]"

    @russian_lang_ep = "EP:sport_life:rus_lang"
    @ukraine_lang_ep = "EP:sport_life:ukr_lang"

    @russian_lang_ta = "sport_life:rus_lang"
    @ukraine_lang_ta = "sport_life:ukr_lang"
    super
  end

  def click_ukraine_lang(key = nil)
    return find(:xpath, ta(@ukraine_lang_ep)).click if key == :ep
    return find(:xpath, @ukraine_lang_il).click if key == :il
    find(:xpath, ta(@ukraine_lang_ta, @ukraine_lang_il)).click
  end

  def click_russian_lang(key = nil)
    return find(:xpath, ta(@russian_lang_ep)).click if key == :ep
    return find(:xpath, @russian_lang_il).click if key == :il
    find(:xpath, ta(@russian_lang_ta, @russian_lang_il)).click
  end

end