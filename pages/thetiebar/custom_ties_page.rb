require 'spec_helper'

class TheTiebarCusromPage

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  FIRST_NAME_IL = "(//input[@id='FirstName'])[1]"
  FIRST_NAME_TA = "thetiebar:custom_page:first_name"
  FIRST_NAME_EP = "EP:thetiebar:custom_page:first_name"

  LAST_NAME_IL = "(//input[@id='LastName'])[1]"
  LAST_NAME_TA = "thetiebar:custom_page:last_name"
  LAST_NAME_EP = "EP:thetiebar:custom_page:last_name"

  EMAIL_IL = "(//input[@id='Email'])[1]"
  EMAIL_TA = "thetiebar:custom_page:email"
  EMAIL_EP = "EP:thetiebar:custom_page:email"

  ADDRESS_IL =  "(//input[@id='Address'])[1]"
  ADDRESS_TA = "thetiebar:custom_page:address"
  ADDRESS_EP = "EP:thetiebar:custom_page:address"

  CITY_IL =  "(//input[@id='City'])[1]"
  CITY_TA = "thetiebar:custom_page:city"
  CITY_EP = "EP:thetiebar:custom_page:city"

  STATE_IL =  "(//select[@id='shipping_state'])[1]"
  STATE_TA = "thetiebar:custom_page:shipping_state"
  STATE_EP = "EP:thetiebar:custom_page:shipping_state"

  ZIP_CODE_IL =  "(//input[@id='ZipPostalCode'])[1]"
  ZIP_CODE_TA = "thetiebar:custom_page:zip_postal_code"
  ZIP_CODE_EP = "EP:thetiebar:custom_page:zip_postal_code"

  PHONE_NUMBER_IL =  "(//input[@id='PhoneNumber'])[1]"
  PHONE_NUMBER_TA = "thetiebar:custom_page:phone_number"
  PHONE_NUMBER_EP = "EP:thetiebar:custom_page:phone_number"

  BOW_TIES_1_IL =  "(//input[@id='BowTies1'])[1]"
  BOW_TIES_1_TA = "thetiebar:custom_page:bow_ties1"
  BOW_TIES_1_EP = "EP:thetiebar:custom_page:bow_ties1"

  SCARVES_2_IL =  "(//input[@id='Scarves2'])[1]"
  SCARVES_2_TA = "thetiebar:custom_page:scarves2"
  SCARVES_2_EP = "EP:thetiebar:custom_page:scarves2"

  TIES_3_IL =  "(//input[@id='Ties3'])[1]"
  TIES_3_TA = "thetiebar:custom_page:ties3"
  TIES_3_EP = "EP:thetiebar:custom_page:ties3"

  SUBMIT_IL =  "(//input[@id='Submit'])[1]"
  SUBMIT_TA = "thetiebar:custom_page:ties3"
  SUBMIT_EP = "EP:thetiebar:custom_page:ties3"

  def fill_first_name_field(key = nil, value)
    return find(ta(FIRST_NAME_EP)).set(value) if key == :ep
    return find(:xpath, FIRST_NAME_IL).set(value) if key == :il
    find(:xpath, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set(value)
  end

  def fill_last_name_field(key = nil, value)
    return find(ta(LAST_NAME_EP)).set(value) if key == :ep
    return find(:xpath, LAST_NAME_IL).set(value) if key == :il
    find(:xpath, ta(LAST_NAME_TA, LAST_NAME_IL)).set(value)
  end

  def fill_address_field(key = nil, value)
    return find(ta(ADDRESS_EP)).set(value) if key == :ep
    return find(:xpath, ADDRESS_IL).set(value) if key == :il
    find(:xpath, ta(ADDRESS_TA, ADDRESS_IL)).set(value)
  end

  def fill_email_field(key = nil, value)
    return find(ta(EMAIL_EP)).set(value) if key == :ep
    return find(:xpath, EMAIL_IL).set(value) if key == :il
    find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(value)
  end

  def fill_city_field(key = nil, value)
    return find(ta(CITY_EP)).set(value) if key == :ep
    return find(:xpath, CITY_IL).set(value) if key == :il
    find(:xpath, ta(CITY_TA, CITY_IL)).set(value)
  end

  def fill_state_field(key = nil, value)
    return find(ta(STATE_EP)).select(value) if key == :ep
    return find(:xpath, STATE_IL).select(value) if key == :il
    find(:xpath, ta(STATE_TA, STATE_IL)).select(value)
  end

  def fill_zip_code_field(key = nil, value)
    return find(ta(ZIP_CODE_EP)).set(value) if key == :ep
    return find(:xpath, ZIP_CODE_IL).set(value) if key == :il
    find(:xpath, ta(ZIP_CODE_TA, ZIP_CODE_IL)).set(value)
  end

  def fill_phone_number_field(key = nil, value)
    return find(ta(PHONE_NUMBER_EP)).set(value) if key == :ep
    return find(:xpath, PHONE_NUMBER_IL).set(value) if key == :il
    find(:xpath, ta(PHONE_NUMBER_TA, PHONE_NUMBER_IL)).set(value)
  end

  def select_bow_ties_1_radiobtn(key = nil)
    return find(ta(BOW_TIES_1_EP)).click if key == :ep
    return find(:xpath, BOW_TIES_1_IL).click if key == :il
    find(:xpath, ta(BOW_TIES_1_TA, BOW_TIES_1_IL)).click
  end

  def select_scarves_2_radiobtn(key = nil)
    return find(ta(SCARVES_2_EP)).click if key == :ep
    return find(:xpath, SCARVES_2_IL).click if key == :il
    find(:xpath, ta(SCARVES_2_TA, SCARVES_2_IL)).click
  end

  def select_ties_3_radiobtn(key = nil)
    return find(ta(TIES_3_EP)).click if key == :ep
    return find(:xpath, TIES_3_IL).click if key == :il
    find(:xpath, ta(TIES_3_TA, TIES_3_IL)).click
  end

  def click_submit_btn(key = nil)
    return find(ta(SUBMIT_EP)).click if key == :ep
    return find(:xpath, SUBMIT_IL).click if key == :il
    find(:xpath, ta(SUBMIT_TA, SUBMIT_IL)).click
  end

end