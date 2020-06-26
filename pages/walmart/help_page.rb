require_relative '../page_extension'

class HelpPageWalmart < PageExtension


  WELCOME_HELP_CENTER_IL = "//h1[text()='Welcome to the Walmart Help Center']"
  WELCOME_HELP_CENTER_TA = "walmart:help_page:welcome_help_center_h1"

  ORDER_TRUCK_LINK_IL = "#quickLink-truck"
  ORDER_TRUCK_LINK_TA = "walmart:help_page:order_truck_link"

  HOW_ORDER_TRACK_H3_IL = "#article-heading"
  HOW_ORDER_TRACK_H3_TA = "walmart:help_page:how_order_track_h3"

  CANCEL_ORDER_LINK_IL = "#quickLink-package"
  CANCEL_ORDER_LINK_TA = "walmart:help_page:cancel_order_link"

  HOW_CANCEL_ORDER_IL = "//h3[text()='How do I cancel an order?']"
  HOW_CANCEL_ORDER_TA = "walmart:help_page:how_cancel_order"

  PICKUP_DELIVERY_LINK_IL = "#quickLink-grocery-alt"
  PICKUP_DELIVERY_LINK_TA = "walmart:help_page:pickup_delivery_link"

  ASKED_QUESTIONS_IL = "#channel-title"
  ASKED_QUESTIONS_TA = "walmart:help_page:asked_questions_text"

  WALMART_ACCOUNT_IL = "//a[@id='channel1']/div[text()='Walmart.com Account']"
  WALMART_ACCOUNT_TA = "walmart:help_page:walmart_account_link"

  MANAGE_YOUR_ACC_IL = "//h3[text()='Manage Your Account']"
  MANAGE_YOUR_ACC_TA = "walmart:help_page:manage_your_acc"

  EMAIL_COMMUNICATION_IL = "//span[text()='Email Communication']"
  EMAIL_COMMUNICATION_TA = "walmart:help_page:email_communication"

  EMAIL_COMMUNICATION_TYPES_IL = "//h2[text()='Email Confirmation Types']"
  EMAIL_COMMUNICATION_TYPES_TA = "walmart:help_page:email_communication_types"

  SEARCH_BAR_IL = "#searchInputBar"
  SEARCH_BAR_TA = "walmart:help_page:search_bar"

  SEARCH_ICON_IL = "#fullSearch"
  SEARCH_ICON_TA = "walmart:help_page:search_icon"

  SEARCH_RESULT_LINE_IL = "#searchHeader"
  SEARCH_RESULT_LINE_TA = "walmart:help_page:search_result_line"


  def should_see_help_center_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: WELCOME_HELP_CENTER_TA, il: WELCOME_HELP_CENTER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_order_truck_link(key = nil)
    find_element(key, il_type: :css, tl: ORDER_TRUCK_LINK_TA, il: ORDER_TRUCK_LINK_IL, check_path: $check_path).click
  end

  def should_see_how_order_track_h3(key = nil)
    element = find_element(key, il_type: :css, tl: HOW_ORDER_TRACK_H3_TA, il: HOW_ORDER_TRACK_H3_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_cancel_order_link(key = nil)
    find_element(key, il_type: :css, tl: CANCEL_ORDER_LINK_TA, il: CANCEL_ORDER_LINK_IL, check_path: $check_path).click
  end

  def should_see_how_cancel_order_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HOW_CANCEL_ORDER_TA, il: HOW_CANCEL_ORDER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_pickup_delivery_link(key = nil)
    find_element(key, il_type: :css, tl: PICKUP_DELIVERY_LINK_TA, il: PICKUP_DELIVERY_LINK_IL, check_path: $check_path).click
  end

  def should_see_asked_questions(key = nil)
    element = find_element(key, il_type: :css, tl: ASKED_QUESTIONS_TA, il: ASKED_QUESTIONS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_walmart_account_link(key = nil)
    find_element(key, il_type: :xpath, tl: WALMART_ACCOUNT_TA, il: WALMART_ACCOUNT_IL, check_path: $check_path).click
  end

  def should_see_manage_your_acc(key = nil)
    element = find_element(key, il_type: :xpath, tl: MANAGE_YOUR_ACC_TA, il: MANAGE_YOUR_ACC_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_email_communication(key = nil)
    find_element(key, il_type: :xpath, tl: EMAIL_COMMUNICATION_TA, il: EMAIL_COMMUNICATION_IL, check_path: $check_path).click
  end

  def should_see_email_communication_types(key = nil)
    element = find_element(key, il_type: :xpath, tl: EMAIL_COMMUNICATION_TYPES_TA, il: EMAIL_COMMUNICATION_TYPES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_search_bar(key = nil, value)
    find_element(key, il_type: :css, tl: SEARCH_BAR_TA, il: SEARCH_BAR_IL, check_path: $check_path).set(value)
  end

  def click_search_icon(key = nil)
    find_element(key, il_type: :css, tl: SEARCH_ICON_TA, il: SEARCH_ICON_IL, check_path: $check_path).click
  end

  def should_see_search_result_line(key = nil)
    element = find_element(key, il_type: :css, tl: SEARCH_RESULT_LINE_TA, il: SEARCH_RESULT_LINE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end