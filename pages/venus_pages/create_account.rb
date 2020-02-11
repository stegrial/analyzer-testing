require 'spec_helper'
require_relative '../../helpers/special_methods'

class VenusCreateAccount
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  FIRST_NAME_FIELD_IL = 'ctl00_Body1_firstname'
  FIRST_NAME_FIELD_TA = 'venus:create_account_page:first_name_field'
  FIRST_NAME_FIELD_EP = 'EP:venus:create_account_page:first_name_field'

  LAST_NAME_FIELD_IL = 'ctl00_Body1_lastname'
  LAST_NAME_FIELD_TA = 'venus:create_account_page:last_name_field'
  LAST_NAME_FIELD_EP = 'EP:venus:create_account_page:last_name_field'


  def fill_first_name_field(key = nil, first_name)
    post_processing key do
      return find(:id, ta(FIRST_NAME_FIELD_EP)).set(first_name) if key == :ep
      return find(:id, FIRST_NAME_FIELD_IL).set(first_name) if key == :il
      find(:id, ta(FIRST_NAME_FIELD_TA, FIRST_NAME_FIELD_IL)).set(first_name)
    end
  end

  def fill_last_name_field(key = nil, last_name)
    post_processing key do
      return find(:id, ta(LAST_NAME_FIELD_EP)).set(last_name) if key == :ep
      return find(:id, LAST_NAME_FIELD_IL).set(last_name) if key == :il
      find(:id, ta(LAST_NAME_FIELD_TA, LAST_NAME_FIELD_IL)).set(last_name)
    end
  end

end
