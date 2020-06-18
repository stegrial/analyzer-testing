require 'spec_helper'
require_relative '../page_extension'

class CreditVenus < PageExtension

  def fill_first_name_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:first_name_field",
                 il: "#ucApplication_txtFirstName", check_path: $check_path).fill_in with: value
  end

  def fill_last_name_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:last_name_field",
                 il: "#ucApplication_txtLastName", check_path: $check_path).fill_in with: value
  end

  def fill_ssn_area_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:ssn_area_field",
                 il: "#ucApplication_txtSsnArea", check_path: $check_path).fill_in with: value
  end

  def fill_ssn_group_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:ssn_group_field",
                 il: "#ucApplication_txtSsnGroup", check_path: $check_path).fill_in with: value
  end

  def fill_ssn_serial_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:ssn_serial_field",
                 il: "#ucApplication_txtSsnSerial", check_path: $check_path).fill_in with: value
  end

  def fill_birth_month_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:birth_month_field",
                 il: "#ucApplication_txtBirthMonth", check_path: $check_path).fill_in with: value
  end

  def fill_birth_day_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:birth_day_field",
                 il: "#ucApplication_txtBirthDay", check_path: $check_path).fill_in with: value
  end

  def fill_birth_year_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:birth_day_field",
                 il: "#ucApplication_txtBirthYear", check_path: $check_path).fill_in with: value
  end

  def fill_annual_income_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:annual_income_field",
                 il: "#ucApplication_txtAnnualIncome", check_path: $check_path).fill_in with: value
  end

  def fill_address_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:address_field",
                 il: "#ucApplication_txtAddress1", check_path: $check_path).fill_in with: value
  end

  def fill_city_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:city_field",
                 il: "#ucApplication_txtCity", check_path: $check_path).fill_in with: value
  end

  def fill_zip_field(key = nil, value)
    find_element(key, il_type: :css, tl: "credit_venus:zip_field",
                 il: "#ucApplication_txtZip", check_path: $check_path).fill_in with: value
  end

  def click_agreement_checkbox(key = nil)
    find_element(key, il_type: :css, tl: "credit_venus:agreement_checkbox",
                 il: "#ucApplication_chkElectronicConsent", check_path: $check_path).click
  end

  def click_submit_button(key = nil)
    find_element(key, il_type: :css, tl: "credit_venus:submit_button",
                 il: "#ucApplication_btnSubmit", check_path: $check_path).click
  end

end