require_relative '../page_extension'

class CloudBeesNewUser < PageExtension

  USER_NAME_FIELD_IL = '[id=userName]'
  USER_NAME_FIELD_TA = 'cloud_bees:new_user:user_name_fld'

  REAL_NAME_FIELD_IL = '[id=fullUserName]'
  REAL_NAME_FIELD_TA = 'cloud_bees:new_user:real_name_fld'

  EMAIL_FIELD_IL = '[id=email]'
  EMAIL_FIELD_TA = 'cloud_bees:new_user:email_fld'

  PASSWORD_FIELD_IL = '[id=password]'
  PASSWORD_FIELD_TA = 'cloud_bees:new_user:password_fld'

  REPASSWORD_FIELD_IL = '[id=password_confirm]'
  REPASSWORD_FIELD_TA = 'cloud_bees:new_user:repassword_fld'

  CONFIRM_NEW_USER_IL = '[id=submitButton]'
  CONFIRM_NEW_USER_TA = 'cloud_bees:new_user:confirm_btn'


  def fill_user_name_field(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: USER_NAME_FIELD_TA, il: USER_NAME_FIELD_IL, check_path: $check_path).set(name)
    end
  end

  def fill_real_name_field(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :css, tl: REAL_NAME_FIELD_TA, il: REAL_NAME_FIELD_IL, check_path: $check_path).set(name)
    end
  end

  def fill_email_field(key = nil, email)
    within_frame(0) do
      find_element(key, il_type: :css, tl: EMAIL_FIELD_TA, il: EMAIL_FIELD_IL, check_path: $check_path).set(email)
    end
  end

  def fill_password_field(key = nil, pass)
    within_frame(0) do
      find_element(key, il_type: :css, tl: PASSWORD_FIELD_TA, il: PASSWORD_FIELD_IL, check_path: $check_path).set(pass)
    end
  end

  def fill_repassword_field(key = nil, repass)
    within_frame(0) do
      find_element(key, il_type: :css, tl: REPASSWORD_FIELD_TA, il: REPASSWORD_FIELD_IL, check_path: $check_path).set(repass)
    end
  end

  def confirm_create_new_user(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: CONFIRM_NEW_USER_TA, il: CONFIRM_NEW_USER_IL, check_path: $check_path).click
    end
  end

  def check_no_user_filter(key = nil, il, ta, ep)
    #find_element(key, il_type: :css, tl: ADD_NEW_COMPONENT_TA, il: ADD_NEW_COMPONENT_IL).click
    begin
      within_frame(0) do
        return expect(page).not_to have_selector(ta(ep)) if key == :ep
        return expect(page).not_to have_selector(:css, il) if key == :il
        expect(page).not_to have_selector(:css, ta(ta, il))
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts e.message
    end
  end

end
