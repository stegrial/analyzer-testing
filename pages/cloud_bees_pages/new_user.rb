require 'spec_helper'
require_relative '../page_extension'

class CloudBeesNewUser
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  USER_NAME_FIELD_IL = '[id=userName]'
  USER_NAME_FIELD_TA = 'cloud_bees:new_user:user_name_fld'
  USER_NAME_FIELD_EP = 'EP:cloud_bees:new_user:user_name_fld'

  REAL_NAME_FIELD_IL = '[id=fullUserName]'
  REAL_NAME_FIELD_TA = 'cloud_bees:new_user:real_name_fld'
  REAL_NAME_FIELD_EP = 'EP:cloud_bees:new_user:real_name_fld'

  EMAIL_FIELD_IL = '[id=email]'
  EMAIL_FIELD_TA = 'cloud_bees:new_user:email_fld'
  EMAIL_FIELD_EP = 'EP:cloud_bees:new_user:email_fld'

  PASSWORD_FIELD_IL = '[id=password]'
  PASSWORD_FIELD_TA = 'cloud_bees:new_user:password_fld'
  PASSWORD_FIELD_EP = 'EP:cloud_bees:new_user:password_fld'

  REPASSWORD_FIELD_IL = '[id=password_confirm]'
  REPASSWORD_FIELD_TA = 'cloud_bees:new_user:repassword_fld'
  REPASSWORD_FIELD_EP = 'EP:cloud_bees:new_user:repassword_fld'

  CONFIRM_NEW_USER_IL = '[id=submitButton]'
  CONFIRM_NEW_USER_TA = 'cloud_bees:new_user:confirm_btn'
  CONFIRM_NEW_USER_EP = 'EP:cloud_bees:new_user:confirm_btn'

  def fill_user_name_field(key = nil, name)
    post_processing key do
      within_frame(0) do
        return find(ta(USER_NAME_FIELD_EP)).set(name) if key == :ep
        return find(:css, USER_NAME_FIELD_IL).set(name) if key == :il
        find(:css, ta(USER_NAME_FIELD_TA, USER_NAME_FIELD_IL)).set(name)
      end
    end
  end

  def fill_real_name_field(key = nil, name)
    post_processing key do
      within_frame(0) do
        return find(ta(REAL_NAME_FIELD_EP)).set(name) if key == :ep
        return find(:css, REAL_NAME_FIELD_IL).set(name) if key == :il
        find(:css, ta(REAL_NAME_FIELD_TA, REAL_NAME_FIELD_IL)).set(name)
      end
    end
  end

  def fill_email_field(key = nil, email)
    post_processing key do
      within_frame(0) do
        return find(ta(EMAIL_FIELD_EP)).set(email) if key == :ep
        return find(:css, EMAIL_FIELD_IL).set(email) if key == :il
        find(:css, ta(EMAIL_FIELD_TA, EMAIL_FIELD_IL)).set(email)
      end
    end
  end

  def fill_password_field(key = nil, pass)
    post_processing key do
      within_frame(0) do
        return find(ta(PASSWORD_FIELD_EP)).set(pass) if key == :ep
        return find(:css, PASSWORD_FIELD_IL).set(pass) if key == :il
        find(:css, ta(PASSWORD_FIELD_TA, PASSWORD_FIELD_IL)).set(pass)
      end
    end
  end

  def fill_repassword_field(key = nil, repass)
    post_processing key do
      within_frame(0) do
        return find(ta(REPASSWORD_FIELD_EP)).set(repass) if key == :ep
        return find(:css, REPASSWORD_FIELD_IL).set(repass) if key == :il
        find(:css, ta(REPASSWORD_FIELD_TA, REPASSWORD_FIELD_IL)).set(repass)
      end
    end
  end

  def confirm_create_new_user(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(CONFIRM_NEW_USER_EP)).click if key == :ep
        return find(:css, CONFIRM_NEW_USER_IL).click if key == :il
        find(:css, ta(CONFIRM_NEW_USER_TA, CONFIRM_NEW_USER_IL)).click
      end
    end
  end

  def check_no_user_filter(key = nil, il, ta, ep)
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