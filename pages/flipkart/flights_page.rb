require_relative '../page_extension'

class FlightPageFlipkart < PageExtension


  ROUND_TRIP_IL = "//label[@for='ROUND_TRIP']"
  ROUND_TRIP_TA = "flipkart:flight_page:round_trip"

  FROM_INPUT_IL = "//input[contains(@class,'_1qpQfA _366U7Q')]"
  FROM_INPUT_TA = "flipkart:flight_page:from_input"

  TO_INPUT_IL = "//input[contains(@class,'_1ljU-s _366U7Q')]"
  TO_INPUT_TA = "flipkart:flight_page:to_input"

  MUMBAI_IL = "(//div[text()='BOM'])[1]"
  MUMBAI_TA = "flipkart:flight_page:Mumbai"

  ODESA_IL = "(//div[text()='ODS'])[1]"
  ODESA_TA = "flipkart:flight_page:Odesa"

  DEPART_ON_IL = "//input[@name='0-datefrom']"
  DEPART_ON_TA = "flipkart:flight_page:depart_on"

  RETURN_ON_IL = "//input[@name='0-dateto']"
  RETURN_ON_TA = "flipkart:flight_page:return_on"

  DEPART_CURRENT_MONTH_YEAR_IL = "(//div[@class='_3F0tlh'])[1]"
  DEPART_CURRENT_MONTH_YEAR_TA = "flipkart:flight_page:depart_current_month_year"

  RETURN_ON_DATE_IL = "((//table[@class='_1pN9kv'])[2]//button[@class='_3ozJ3d'])[20]"
  RETURN_ON_DATE_TA = "flipkart:flight_page:return_on_date"

  TRAVELLERS_CLASS_IL = "//input[@name='0-travellerclasscount']"
  TRAVELLERS_CLASS_TA = "flipkart:flight_page:travellers"

  ADULTS_IL = "//div[text()='Adults']"
  ADULTS_TA = "flipkart:flight_page:adults"

  ADULTS_PLUS_IL = "(//button[@class='_2AkmmA _2lulsm _2DCAah'])[1]"
  ADULTS_PLUS_TA = "flipkart:flight_page:plus_adult_person"

  PREMIUM_CABIN_CLASS_IL = "//div[text()='Premium Economy']"
  PREMIUM_CABIN_CLASS_TA = "flipkart:flight_page:premium_class"

  DONE_BTN_IL = "//button[text()='Done']"
  DONE_BTN_TA = "flipkart:flight_page:done_btn"

  SEARCH_BTN_IL = "//span[text()='SEARCH']"
  SEARCH_BTN_TA = "flipkart:flight_page:search_btn"


  def click_round_trip(key = nil)
    find_element(key, il_type: :xpath, tl: ROUND_TRIP_TA, il: ROUND_TRIP_IL, check_path: $check_path).click
  end

  def fill_from_input(key = nil,value)
    find_element(key, il_type: :xpath, tl: FROM_INPUT_TA, il: FROM_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_to_input(key = nil,value)
    find_element(key, il_type: :xpath, tl: TO_INPUT_TA, il: TO_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_Mumbai_from_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: MUMBAI_TA, il: MUMBAI_IL, check_path: $check_path).click
    end

  def click_Odesa_from_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: ODESA_TA, il: ODESA_IL, check_path: $check_path).click
  end

  def click_depart_on(key = nil)
    find_element(key, il_type: :xpath, tl: DEPART_ON_TA, il: DEPART_ON_IL, check_path: $check_path).click
  end

  def click_return_on(key = nil)
    find_element(key, il_type: :xpath, tl: RETURN_ON_TA, il: RETURN_ON_IL, check_path: $check_path).click
  end

  def should_see_depart_current_month_year(key = nil)
    element = find_element(key, il_type: :xpath, tl: DEPART_CURRENT_MONTH_YEAR_TA, il: DEPART_CURRENT_MONTH_YEAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_return_on_date(key = nil)
    find_element(key, il_type: :xpath, tl: RETURN_ON_DATE_TA, il: RETURN_ON_DATE_IL, check_path: $check_path).click
  end

  def click_travellers(key = nil)
    find_element(key, il_type: :xpath, tl: TRAVELLERS_CLASS_TA, il: TRAVELLERS_CLASS_IL, check_path: $check_path).click
  end

  def should_see_adults(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADULTS_TA, il: ADULTS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_plus_adult_person(key = nil)
    find_element(key, il_type: :xpath, tl: ADULTS_PLUS_TA, il: ADULTS_PLUS_IL, check_path: $check_path).click
  end

  def click_premium_class(key = nil)
    find_element(key, il_type: :xpath, tl: PREMIUM_CABIN_CLASS_TA, il: PREMIUM_CABIN_CLASS_IL, check_path: $check_path).click
  end

  def click_done_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DONE_BTN_TA, il: DONE_BTN_IL, check_path: $check_path).click
  end

  def click_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
  end

end