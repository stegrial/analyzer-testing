require 'spec_helper'
require_relative '../helpers/special_methods'

class ZincLabs
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  SIGN_IN_GOOGLE_IL = "//div[@class='text-center' and .//img[@alt='Login with ClassLink']]"
  SIGN_IN_GOOGLE_TA = "zinc_labs:sig_in_page:sign_in_google"
  SIGN_IN_GOOGLE_EP = "EP:zinc_labs:sig_in_page:sign_in_google"

  def click_sign_in_google(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGN_IN_GOOGLE_EP)).click if key == :ep
      return find(:xpath, SIGN_IN_GOOGLE_IL).click if key == :il
      find(:xpath, ta(SIGN_IN_GOOGLE_TA, SIGN_IN_GOOGLE_IL))
    end
  end

end

