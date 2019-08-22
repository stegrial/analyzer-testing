require 'spec_helper'

class CloudBeesApps
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  APPLICATION_FROM_LIST_IL = "//a[@title='AppJul_NOT_DELETE']"
  APPLICATION_FROM_LIST_TA = "ec_flow:application_from_list"
  APPLICATION_FROM_LIST_EP = "EP:ec_flow:application_from_list"

  def select_application_from_list(key = nil)
    return find(ta(APPLICATION_FROM_LIST_EP)).click if key == :ep
    return find(:xpath, APPLICATION_FROM_LIST_IL).click if key == :il
    find(:xpath, ta(APPLICATION_FROM_LIST_TA, APPLICATION_FROM_LIST_IL)).click
  end


end