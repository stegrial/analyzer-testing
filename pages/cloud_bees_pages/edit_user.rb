require 'spec_helper'

class CloudBeesEditUser
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  ADMIN_PASS_FIELD_IL = '[id=sessionPassword]'
  ADMIN_PASS_FIELD_TA = 'cloud_bees:edit_user:admin_password_fld'
  ADMIN_PASS_FIELD_EP = 'EP:cloud_bees:edit_user:admin_password_fld'

  USER_PASS_FIELD_IL = '[id=password]'
  USER_PASS_FIELD_TA = 'cloud_bees:edit_user:user_password_fld'
  USER_PASS_FIELD_EP = 'EP:cloud_bees:edit_user:user_password_fld'

  USER_REPASS_FIELD_IL = '[id=password_confirm]'
  USER_REPASS_FIELD_TA = 'cloud_bees:edit_user:user_repassword_fld'
  USER_REPASS_FIELD_EP = 'EP:cloud_bees:edit_user:user_repassword_fld'

  UPDATE_USER_DATA_BTN_IL = '[id=submitButton]'
  UPDATE_USER_DATA_BTN_TA = 'cloud_bees:edit_user:update_user_data_btn'
  UPDATE_USER_DATA_BTN_EP = 'EP:cloud_bees:edit_user:update_user_data_btn'

  def fill_admin_password_field(key = nil, name)
    within_frame(0) do
      return find(ta(ADMIN_PASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, ADMIN_PASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(ADMIN_PASS_FIELD_TA, ADMIN_PASS_FIELD_IL)).set(name)
    end
  end

  def fill_new_user_password(key = nil, name)
    within_frame(0) do
      return find(ta(USER_PASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, USER_PASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(USER_PASS_FIELD_TA, USER_PASS_FIELD_IL)).set(name)
    end
  end

  def fill_new_user_repassword(key = nil, name)
    within_frame(0) do
      return find(ta(USER_REPASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, USER_REPASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(USER_REPASS_FIELD_TA, USER_REPASS_FIELD_IL)).set(name)
    end
  end

  def update_user_data(key = nil)
    within_frame(0) do
      return find(ta(UPDATE_USER_DATA_BTN_EP)).click if key == :ep
      return find(:css, UPDATE_USER_DATA_BTN_IL).click if key == :il
      find(:css, ta(UPDATE_USER_DATA_BTN_TA, UPDATE_USER_DATA_BTN_IL)).click
    end
  end


end