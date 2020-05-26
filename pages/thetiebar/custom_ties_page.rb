require_relative '../page_extension'

class TheTiebarCusromPage < PageExtension

  FIRST_NAME_IL = "(//input[@id='FirstName'])[1]"
  FIRST_NAME_TA = "thetiebar:custom_page:first_name"

  LAST_NAME_IL = "(//input[@id='LastName'])[1]"
  LAST_NAME_TA = "thetiebar:custom_page:last_name"

  EMAIL_IL = "(//input[@id='Email'])[1]"
  EMAIL_TA = "thetiebar:custom_page:email"

  ADDRESS_IL = "(//input[@id='Address'])[1]"
  ADDRESS_TA = "thetiebar:custom_page:address"

  CITY_IL = "(//input[@id='City'])[1]"
  CITY_TA = "thetiebar:custom_page:city"

  STATE_IL = "(//select[@id='shipping_state'])[1]"
  STATE_TA = "thetiebar:custom_page:shipping_state"

  ZIP_CODE_IL = "(//input[@id='ZipPostalCode'])[1]"
  ZIP_CODE_TA = "thetiebar:custom_page:zip_postal_code"

  PHONE_NUMBER_IL = "(//input[@id='PhoneNumber'])[1]"
  PHONE_NUMBER_TA = "thetiebar:custom_page:phone_number"

  BOW_TIES_1_IL = "(//input[@id='BowTies1'])[1]"
  BOW_TIES_1_TA = "thetiebar:custom_page:bow_ties1"

  SCARVES_2_IL = "(//input[@id='Scarves2'])[1]"
  SCARVES_2_TA = "thetiebar:custom_page:scarves2"

  TIES_3_IL = "(//input[@id='Ties3'])[1]"
  TIES_3_TA = "thetiebar:custom_page:ties3"

  SUBMIT_IL = "(//input[@id='Submit'])[1]"
  SUBMIT_TA = "thetiebar:custom_page:Submit"


  def fill_first_name_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: FIRST_NAME_TA, il: FIRST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_last_name_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: LAST_NAME_TA, il: LAST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_address_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ADDRESS_TA, il: ADDRESS_IL, check_path: $check_path).set(value)
  end

  def fill_email_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(value)
  end

  def fill_city_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: CITY_TA, il: CITY_IL, check_path: $check_path).set(value)
  end

  def fill_state_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: STATE_TA, il: STATE_IL, check_path: $check_path).select(value)
  end

  def fill_zip_code_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ZIP_CODE_TA, il: ZIP_CODE_IL, check_path: $check_path).set(value)
  end

  def fill_phone_number_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: PHONE_NUMBER_TA, il: PHONE_NUMBER_IL, check_path: $check_path).set(value)
  end

  def select_bow_ties_1_radiobtn(key = nil)
    find_element(key, il_type: :xpath, tl: BOW_TIES_1_TA, il: BOW_TIES_1_IL, check_path: $check_path).click
  end

  def select_scarves_2_radiobtn(key = nil)
    find_element(key, il_type: :xpath, tl: SCARVES_2_TA, il: SCARVES_2_IL, check_path: $check_path).click
  end

  def select_ties_3_radiobtn(key = nil)
    find_element(key, il_type: :xpath, tl: TIES_3_TA, il: TIES_3_IL, check_path: $check_path).click
  end

  def click_submit_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SUBMIT_TA, il: SUBMIT_IL, check_path: $check_path).click
  end

end
