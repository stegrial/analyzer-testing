require 'capybara/rspec'
require 'selenium-webdriver'

module HowToGetMoney

  def initialize(*args)
    @first_loan_il = "//a[text()='Займ до 15000 грн на свою карту']"
    @first_loan_ta = "how_to_get_money:first_loan"
    @first_loan_ep = "EP:how_to_get_money:first_loan"
    super
  end

  # class << self
  #   attr_reader :first_loan_il,
  # end

  def click_first_loan_link(key = nil)
    return find(:xpath, ta(@first_loan_ep)).click if key == :ep
    return find(:xpath, @first_loan_il).click if key == :il
    find(:xpath, ta(@first_loan_ta, @first_loan_il)).click
  end

  # def click_element(link_name, ep = false)
  #   return find(:xpath, ta(self.instance_variable_get("@#{link_name}_ep"))).click if ep
  #   find(:xpath, ta(self.instance_variable_get("@#{link_name}_ta"), self.instance_variable_get("@#{link_name}_il"))).click
  # end

  # def click_element(link_name, ep = false)
  #   return find(:xpath, ta(@selectors[link_name]['ep'])).click if ep
  #   find(:xpath, ta(self.instance_variable_get("@#{link_name}_ta"), self.instance_variable_get("@#{link_name}_il"))).click
  # end

end
