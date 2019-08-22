require 'spec_helper'

class CloudBeesEditUser
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  EDIT_ADMIN_PASS_FIELD_IL = '[id=sessionPassword]'
  EDIT_ADMIN_PASS_FIELD_TA = 'cloud_bees:edit_user:admin_password_fld'
  EDIT_ADMIN_PASS_FIELD_EP = 'EP:cloud_bees:edit_user:admin_password_fld'

  EDIT_USER_PASS_FIELD_IL = '[id=password]'
  EDIT_USER_PASS_FIELD_TA = 'cloud_bees:edit_user:password_fld'
  EDIT_USER_PASS_FIELD_EP = 'EP:cloud_bees:edit_user:password_fld'

  EDIT_USER_REPASS_FIELD_IL = '[id=password_confirm]'
  EDIT_USER_REPASS_FIELD_TA = 'cloud_bees:edit_user:repassword_fld'
  EDIT_USER_REPASS_FIELD_EP = 'EP:cloud_bees:edit_user:repassword_fld'

  APPLY_NEW_USER_DATA_BTN_IL = '[id=submitButton]'
  APPLY_NEW_USER_DATA_BTN_TA = 'cloud_bees:edit_user:apply_data_btn'
  APPLY_NEW_USER_DATA_BTN_EP = 'EP:cloud_bees:edit_user:apply_data_btn'

  def fill_admin_password_field(key = nil, name)
    within_frame(0) do
      return find(ta(EDIT_ADMIN_PASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, EDIT_ADMIN_PASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(EDIT_ADMIN_PASS_FIELD_TA, EDIT_ADMIN_PASS_FIELD_IL)).set(name)
    end
  end

  def update_user_password(key = nil, name)
    within_frame(0) do
      return find(ta(EDIT_USER_PASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, EDIT_USER_PASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(EDIT_USER_PASS_FIELD_TA, EDIT_USER_PASS_FIELD_IL)).set(name)
    end
  end

  def update_user_repassword(key = nil, name)
    within_frame(0) do
      return find(ta(EDIT_USER_REPASS_FIELD_EP)).set(name) if key == :ep
      return find(:css, EDIT_USER_REPASS_FIELD_IL).set(name) if key == :il
      find(:css, ta(EDIT_USER_REPASS_FIELD_TA, EDIT_USER_REPASS_FIELD_IL)).set(name)
    end
  end

  def apply_new_user_data(key = nil)
    within_frame(0) do
      return find(ta(APPLY_NEW_USER_DATA_BTN_EP)).click if key == :ep
      return find(:css, APPLY_NEW_USER_DATA_BTN_IL).click if key == :il
      find(:css, ta(APPLY_NEW_USER_DATA_BTN_TA, APPLY_NEW_USER_DATA_BTN_IL)).click
    end
  end


end