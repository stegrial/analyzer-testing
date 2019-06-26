require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'united_methods'

include PathCheck

module HowToGetMoney

  def initialize(*args)
    @first_loan_il = "//a[text()='Первый займ под 0% до 6000 грн!']"
    @first_loan_ta = "how_to_get_money:first_loan"
    @first_loan_ep = "EP:how_to_get_money:first_loan"
    super
  end

  # class << self
  #   attr_reader :first_loan_il,
  # end

  def click_first_loan_link
    find(:xpath, ta(@first_loan_ta, @first_loan_il)).click
  end

  def check_first_loan_link
    check_element_path @first_loan_ta, @first_loan_il
  end

  def ep_click_first_loan_link
    check_element_path @first_loan_ep, @first_loan_il
    find(:xpath, ta(@first_loan_ep)).click
  end

end
