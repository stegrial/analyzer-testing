require 'spec_helper'

class CloudBeesPipelines
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  CHOOSE_PIPELINE_IL = "//div/a[@title='pipJul_NOT_DELETE']"
  CHOOSE_PIPELINE_TA = "ec_flow:choose_pipeline"
  CHOOSE_PIPELINE_EP = "EP:ec_flow:choose_pipeline"

  def choose_pipeline_from_list(key = nil)
    return find(ta(CHOOSE_PIPELINE_EP)).click if key == :ep
    return find(:xpath, CHOOSE_PIPELINE_IL).click if key == :il
    find(:xpath, ta(CHOOSE_PIPELINE_TA, CHOOSE_PIPELINE_IL)).click
  end



end