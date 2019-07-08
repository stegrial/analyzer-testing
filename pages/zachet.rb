require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

module Zachet

  def initialize(*args)
    @logotype_il = "//div[@class='logo top-menu']"
    @logotype_ta = "zachet:logotype"
    @logotype_ep = "EP:zachet:logotype"
    super
  end

  def click_logotype(key = nil)
    return find(:xpath, ta(@logotype_ep)).click if key == :ep
    return find(:xpath, @logotype_il).click if key == :il
    find(:xpath, ta(@logotype_ta, @logotype_il)).click
  end


end

