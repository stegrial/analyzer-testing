require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module Zachet

  def initialize(*args)
    @logotype_il = "//div[@class='logo top-menu']"
    @logotype_ta = "zachet:logotype"
    @logotype_ep = "EP:zachet:logotype"
    super
  end

  def click_logotype
    find(:xpath, ta(@logotype_ta, @logotype_il)).click
  end

  def check_logotype
    check_element_path @logotype_ta, @logotype_il
  end

  def ep_click_logotype
    check_element_path @logotype_ep, @logotype_il
    find(:xpath, ta(@logotype_ep)).click
  end


end

