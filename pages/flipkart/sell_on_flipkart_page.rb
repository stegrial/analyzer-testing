require_relative '../page_extension'

class SellOnFlipkartPage < PageExtension


   SELL_ON_FLIPKART_LINK_IL = "//a[contains(@href, 'seller.flipkart.com/?utm_source=flipkart&utm_medium=')]"
   SELL_ON_FLIPKART_LINK_TA = "flipkart:sell_on_page:sell_on_link"

   LOGIN_FOR_EXISTING_IL = "//span[text()='Login for existing sellers']"
   LOGIN_FOR_EXISTING_TA = "flipkart:sell_on_page:login_for_existing_sellers"

   USERNAME_IL = "//input[@name='username']"
   USERNAME_TA = "flipkart:sell_on_page:username"

   PASSWORD_IL = "//input[@name='password']"
   PASSWORD_TA = "flipkart:sell_on_page:password"

   LOGIN_BTN_IL = "//button/span[text()='Login']"
   LOGIN_BTN_TA = "flipkart:sell_on_page:login_btn"

   CLOSE_MODAL_BTN_IL = "//div[@class='sc-fzqLLg kCMTKY']"
   CLOSE_MODAL_BTN_TA = "flipkart:sell_on_page:close_modal_btn"

   HOW_TO_REGISTER_TAB_IL = "(//div[text()='HOW TO REGISTER'])[2]"
   HOW_TO_REGISTER_TAB_TA = "flipkart:sell_on_page:how_to_register_tab"

   REGISTER_BTN_IL = "(//a[contains(@href, '=flipkart&utm_medium=website&utm_campaign=sellbutton')])[2]"
   REGISTER_BTN_TA = "flipkart:sell_on_page:register_btn"

   WHY_SELL_ONLINE_IL = "(//div[text()='WHY SELL ONLINE'])[1]"
   WHY_SELL_ONLINE_TA = "flipkart:sell_on_page:why_sell_online"

   LEARN_MORE_IL = "//span[text()='Learn More']"
   LEARN_MORE_TA = "flipkart:sell_on_page:learn_more_link"

   ONBOARDING_TEXT_IL = "//div[text()='Onboarding']"
   ONBOARDING_TEXT_TA = "flipkart:sell_on_page:Onboarding"

   KNOW_MORE_IL = "//div[text()='Know more']"
   KNOW_MORE_TA = "flipkart:sell_on_page:know_more_link"

   GROWTH_TEXT_IL = "//div[text()='Growth']"
   GROWTH_TEXT_TA = "flipkart:sell_on_page:growth_text"


   def click_sell_on_link(key = nil)
      find_element(key, il_type: :xpath, tl: SELL_ON_FLIPKART_LINK_TA, il: SELL_ON_FLIPKART_LINK_IL, check_path: $check_path).click
   end

   def click_login_existing_sellers(key = nil)
     find_element(key, il_type: :xpath, tl: LOGIN_FOR_EXISTING_TA, il: LOGIN_FOR_EXISTING_IL, check_path: $check_path).click
   end

   def fill_username_input(key = nil, value)
     find_element(key, il_type: :xpath, tl: USERNAME_TA, il: USERNAME_IL, check_path: $check_path).set(value)
   end

   def fill_password_input(key = nil, value)
     find_element(key, il_type: :xpath, tl: PASSWORD_TA, il: PASSWORD_IL, check_path: $check_path).set(value)
   end

   def click_login_btn(key = nil)
     find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
   end

   def click_close_modal_btn(key = nil)
     find_element(key, il_type: :xpath, tl: CLOSE_MODAL_BTN_TA, il: CLOSE_MODAL_BTN_IL, check_path: $check_path).click
   end

   def click_how_to_register_tab(key = nil)
     find_element(key, il_type: :xpath, tl: HOW_TO_REGISTER_TAB_TA, il: HOW_TO_REGISTER_TAB_IL, check_path: $check_path).click
   end

   def should_see_register_btn(key = nil)
     element = find_element(key, il_type: :xpath, tl: REGISTER_BTN_TA, il: REGISTER_BTN_IL, check_path: $check_path)
     expect(element).to be_visible
   end

   def click_why_sell_online_tab(key = nil)
     find_element(key, il_type: :xpath, tl: WHY_SELL_ONLINE_TA, il: WHY_SELL_ONLINE_IL, check_path: $check_path).click
   end

   def click_learn_more_link(key = nil)
     find_element(key, il_type: :xpath, tl: LEARN_MORE_TA, il: LEARN_MORE_IL, check_path: $check_path).click
   end

   def should_see_onboarding_text(key = nil)
     element = find_element(key, il_type: :xpath, tl: ONBOARDING_TEXT_TA, il: ONBOARDING_TEXT_IL, check_path: $check_path)
     expect(element).to be_visible
   end

   def click_know_more_link(key = nil)
     find_element(key, il_type: :xpath, tl: KNOW_MORE_TA, il: KNOW_MORE_IL, check_path: $check_path).click
   end

   def should_see_growth_text(key = nil)
     element = find_element(key, il_type: :xpath, tl: GROWTH_TEXT_TA, il: GROWTH_TEXT_IL, check_path: $check_path)
     expect(element).to be_visible
   end

end