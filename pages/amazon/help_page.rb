require_relative '../page_extension'

class HelpPage < PageExtension


  HELP_PAGE_IL = "//h1[contains(text(),'can we help you')]"
  HELP_PAGE_TA = "amazon:help_page:help_page"

  H2_TEXT_IL = "//h2[contains(text(),'Some things you can do here')]"
  H2_TEXT_TA =  "amazon:help_page:main_text_on_page"

  YOUR_ORDERS_IL = "//div[@class='a-box-inner']//h3[contains(text(),'Your Orders')]"
  YOUR_ORDERS_TA = "amazon:help_page:your_orders"

  YOUR_ACCOUNT_IL = "//div[@class='a-box-inner']//h3[contains(text(),'Your Account')]"
  YOUR_ACCOUNT_TA = "amazon:help_page:your_account"

  MANAGE_PRIME_IL = "//div[@class='a-box-inner']//h3[contains(text(),'Manage Prime')]"
  MANAGE_PRIME_TA = "amazon:help_page:manage_prime"

  HELP_SEARCH_IL = "#helpsearch"
  HELP_SEARCH_TA = "amazon:help_page:help_search"

  GO_BTN_IL = "#helpSearchSubmit"
  GO_BTN_TA = "amazon:help_page:go_button"

  HELP_CUSTOMER_SERVICE_IL = "//a[text()='Help & Customer Service']"
  HELP_CUSTOMER_SERVICE_TA = "amazon:help_page:help_customer_service"

  HELP_TOPICS_IL = "//h3[text()='Help Topics']"
  HELP_TOPICS_TA = "amazon:help_page:help_topics"

  QUICK_SOLUTIONS_IL = "//h3[contains(text(),'Quick solutions')]"
  QUICK_SOLUTIONS_TA = "amazon:help_page:quick_solutions"


  def should_see_help_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: HELP_PAGE_TA, il: HELP_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_main_text_on_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: H2_TEXT_TA, il: H2_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_your_orders(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUR_ORDERS_TA, il: YOUR_ORDERS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_your_account(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUR_ACCOUNT_TA, il: YOUR_ACCOUNT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_manage_prime(key = nil)
    element = find_element(key, il_type: :xpath, tl: MANAGE_PRIME_TA, il: MANAGE_PRIME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_help_search_field(key = nil, value)
    find_element(key, il_type: :css, tl: HELP_SEARCH_TA, il: HELP_SEARCH_IL, check_path: $check_path).set(value)
  end

  def user_click_go_button(key = nil)
    find_element(key, il_type: :css, tl: GO_BTN_TA, il: GO_BTN_IL, check_path: $check_path).click
  end

  def should_see_help_customer_service(key = nil)
    element = find_element(key, il_type: :xpath, tl: HELP_CUSTOMER_SERVICE_TA, il: HELP_CUSTOMER_SERVICE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_help_topics(key = nil)
    element = find_element(key, il_type: :xpath, tl: HELP_TOPICS_TA, il: HELP_TOPICS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_quick_solutions(key = nil)
    element = find_element(key, il_type: :xpath, tl: QUICK_SOLUTIONS_TA, il: QUICK_SOLUTIONS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
