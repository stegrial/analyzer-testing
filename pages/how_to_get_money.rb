require 'spec_helper'
require_relative '../helpers/special_methods'

class HowToGetMoney
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  FIRST_LOAN_IL = "//a[text()='Займ до 15000 грн на свою карту']"
  FIRST_LOAN_TA = 'how_to_get_money:first_loan'
  FIRST_LOAN_EP = 'EP:how_to_get_money:first_loan'

  # def initialize(*args)
  #   @first_loan_il = "//a[text()='Займ до 15000 грн на свою карту']"
  #   @first_loan_ta = "how_to_get_money:first_loan"
  #   @first_loan_ep = "EP:how_to_get_money:first_loan"
  #   super
  # end

  # class << self
  #   attr_reader :first_loan_il,
  # end

  def click_first_loan_link(key = nil)
    post_processing key do
      return find(ta(FIRST_LOAN_EP)).click if key == :ep
      return find(:xpath, FIRST_LOAN_IL).click if key == :il
      find(:xpath, ta(FIRST_LOAN_TA, FIRST_LOAN_IL)).click
    end
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
