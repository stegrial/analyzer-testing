require_relative '../page_extension'

class CloudBeesEditUser < PageExtension

  ADMIN_PASS_FIELD_IL = '[id=sessionPassword]'
  ADMIN_PASS_FIELD_TA = 'cloud_bees:edit_user:admin_password_fld'

  USER_PASS_FIELD_IL = '[id=password]'
  USER_PASS_FIELD_TA = 'cloud_bees:edit_user:user_password_fld'

  USER_REPASS_FIELD_IL = '[id=password_confirm]'
  USER_REPASS_FIELD_TA = 'cloud_bees:edit_user:user_repassword_fld'

  UPDATE_USER_DATA_BTN_IL = '[id=submitButton]'
  UPDATE_USER_DATA_BTN_TA = 'cloud_bees:edit_user:update_user_data_btn'


  def fill_admin_password_field(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: ADMIN_PASS_FIELD_TA, il: ADMIN_PASS_FIELD_IL, check_path: $check_path).set(name)
    end
  end

  def fill_new_user_password(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: USER_PASS_FIELD_TA, il: USER_PASS_FIELD_IL, check_path: $check_path).set(name)
    end
  end

  def fill_new_user_repassword(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: USER_REPASS_FIELD_TA, il: USER_REPASS_FIELD_IL, check_path: $check_path).set(name)
    end
  end

  def update_user_data(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: UPDATE_USER_DATA_BTN_TA, il: UPDATE_USER_DATA_BTN_IL, check_path: $check_path).click
    end
  end

end
