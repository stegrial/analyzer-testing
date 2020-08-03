require_relative '../page_extension'

class AdminDashboardExtJSPage < PageExtension

  DASHBOARD_MENU_IL = "//div[text()='Dashboard']"
  DASHBOARD_MENU_TA = "sencha:admin_dashboard_ext_js:dashboard_menu"

  EMAIL_MENU_IL = "//div[text()='Email']"
  EMAIL_MENU_TA = "sencha:admin_dashboard_ext_js:email_menu"

  PROFILE_MENU_IL = "//div[text()='Profile']"
  PROFILE_MENU_TA = "sencha:admin_dashboard_ext_js:profile_menu"

  SEARCH_RESULTS_MENU_IL = "//div[text()='Search results']"
  SEARCH_RESULTS_MENU_TA = "sencha:admin_dashboard_ext_js:search_result_menu"

  FAQ_MENU_IL = "//div[text()='FAQ']"
  FAQ_MENU_TA = "sencha:admin_dashboard_ext_js:faq_menu"

  PAGES_MENU_IL = "//div[text()='Pages']"
  PAGES_MENU_TA = "sencha:admin_dashboard_ext_js:pages_menu"

  BLANK_PAGE_MENU_IL = "//div[text()='Blank Page']"
  BLANK_PAGE_MENU_TA = "sencha:admin_dashboard_ext_js:blank_page_menu"

  ERROR_404_MENU_IL = "//div[text()='404 Error']"
  ERROR_404_MENU_TA = "sencha:admin_dashboard_ext_js:error_404_menu"

  ERROR_500_MENU_IL = "//div[text()='500 Error']"
  ERROR_500_MENU_TA = "sencha:admin_dashboard_ext_js:error_500_menu"

  WIDGETS_MENU_IL = "//div[text()='Widgets']"
  WIDGETS_MENU_TA = "sencha:admin_dashboard_ext_js:widgets_menu"

  FORMS_MENU_IL = "//div[text()='Forms']"
  FORMS_MENU_TA = "sencha:admin_dashboard_ext_js:forms_menu"

  CHARTS_MENU_IL = "//div[text()='Charts']"
  CHARTS_MENU_TA = "sencha:admin_dashboard_ext_js:charts_menu"

  HAMBURGER_MENU_IL = "//a[@id='main-navigation-btn']"
  HAMBURGER_MENU_TA = "sencha:admin_dashboard_ext_js:hamburger_menu"

  MOBILE_SWITCH_IL = "//a[@id='button-1015']"
  MOBILE_SWITCH_TA = "sencha:admin_dashboard_ext_js:mobile_switch_menu"

  SWITCH_MODERN_NO_IL = "//span[text()='No']"
  SWITCH_MODERN_NO_TA = "sencha:admin_dashboard_ext_js:switch_modern_no"

  SEARCH_LINK_IL = "//span[contains(@class, 'fa-search')]"
  SEARCH_LINK_TA = "sencha:admin_dashboard_ext_js:search_link"

  EMAIL_LINK_IL = "//span[contains(@class, 'fa-envelope')]"
  EMAIL_LINK_TA = "sencha:admin_dashboard_ext_js:email_link"

  FAQ_LINK_IL = "//span[contains(@class, 'fa-question')]"
  FAQ_LINK_TA = "sencha:admin_dashboard_ext_js:faq_link"

  PROFILE_LINK_IL = "//span[contains(@class, 'fa-th-large')]"
  PROFILE_LINK_TA = "sencha:admin_dashboard_ext_js:provile_link"

  FIRST_TODO_IL = "(//table[@data-recordindex='0']//div)[1]"
  FIRST_TODO_TA = "sencha:admin_dashboard_ext_js:first_todo"

  NEW_TASK_IL = "//input[@placeholder='Add New Task']"
  NEW_TASK_TA = "sencha:admin_dashboard_ext_js:new_task"

  ADD_TASK_IL = "//span[contains(@class, 'fa-plus')]"
  ADD_TASK_TA = "sencha:admin_dashboard_ext_js:add_task"

  COMPOSE_LINK_IL = "//span[text()='Compose']"
  COMPOSE_LINK_TA = "sencha:admin_dashboard_ext_js:compose_link"

  DISCARD_BTN_IL = "//span[text()='Discard']"
  DISCARD_BTN_TA = "sencha:admin_dashboard_ext_js:discard_btn"

  INBOX_LINK_IL = "//span[text()='Inbox']"
  INBOX_LINK_TA = "sencha:admin_dashboard_ext_js:inbox_link"

  SENT_MAIL_LINK_IL = "//span[text()='Sent Mail']"
  SENT_MAIL_LINK_TA = "sencha:admin_dashboard_ext_js:sent_mail_link"

  TORRES_TRAN_LINK_IL = "//span[text()='Torres Tran']"
  TORRES_TRAN_LINK_TA = "sencha:admin_dashboard_ext_js:torres_tran_link"

  HINES_MOON_LINK_IL = "//span[text()='Hines Moon']"
  HINES_MOON_LINK_TA = "sencha:admin_dashboard_ext_js:hones_moon_link"

  MOLINA_WILKERSON_LINK_IL = "//span[text()='Molina Wilkerson']"
  MOLINA_WILKERSON_LINK_TA = "sencha:admin_dashboard_ext_js:molina_wilkerson_link"

  SIX_PERSON_IL = "(//table[@data-recordindex='5']//div)[1]"
  SIX_PERSON_TA = "sencha:admin_dashboard_ext_js:six_person"

  SIX_PERSON_PETTY_CALDWELL_IL = "//div[text()='Petty Caldwell']"
  SIX_PERSON_PETTY_CALDWELL_TA = "sencha:admin_dashboard_ext_js:six_person_petty_caldwell"

  TRASH_LINK_IL = "//span[contains(@class, 'fa-trash')]"
  TRASH_LINK_TA = "sencha:admin_dashboard_ext_js:trash_link"

  EXCLAMATION_CIRCLE_LINK_IL = "//span[contains(@class, 'fa-exclamation-circle')]"
  EXCLAMATION_CIRCLE_LINK_TA = "sencha:admin_dashboard_ext_js:exclamation_circle_link"

  PRINT_LINK_IL = "//span[contains(@class, 'fa-print')]"
  PRINT_LINK_TA = "sencha:admin_dashboard_ext_js:print_link"

  EDIN_BOLD_LINK_IL = "//span[contains(@class, 'x-edit-bold')]"
  EDIN_BOLD_LINK_TA = "sencha:admin_dashboard_ext_js:edit_bold_link"

  EDIN_ITALIC_LINK_IL = "//span[contains(@class, 'x-edit-italic')]"
  EDIN_ITALIC_LINK_TA = "sencha:admin_dashboard_ext_js:edit_italic_link"

  EDIN_UNDERLINE_LINK_IL = "//span[contains(@class, 'x-edit-underline')]"
  EDIN_UNDERLINE_LINK_TA = "sencha:admin_dashboard_ext_js:edit_underline_link"

  YOUR_MIND_TEXTAREA_IL = "//textarea[@placeholder=\"What's on your mind?\"]"
  YOUR_MIND_TEXTAREA_TA = "sencha:admin_dashboard_ext_js:your_mind_textarea"

  SHARE_BTN_IL = "//span[text()='Share']"
  SHARE_BTN_TA = "sencha:admin_dashboard_ext_js:share_button"

  VIDEO_LINK_IL = "//span[contains(@class, 'fa-video')]"
  VIDEO_LINK_TA = "sencha:admin_dashboard_ext_js:video_link"

  CAMERA_LINK_IL = "//span[contains(@class, 'fa-camera')]"
  CAMERA_LINK_TA = "sencha:admin_dashboard_ext_js:camera_link"

  FILE_LINK_IL = "//span[contains(@class, 'fa-file')]"
  FILE_LINK_TA = "sencha:admin_dashboard_ext_js:file_link"

  FACEBOOK_LINK_IL = "//span[contains(@class, 'fa-facebook')]"
  FACEBOOK_LINK_TA = "sencha:admin_dashboard_ext_js:facebook_link"

  TWITTER_LINK_IL = "//span[contains(@class, 'fa-twitter')]"
  TWITTER_LINK_TA = "sencha:admin_dashboard_ext_js:twitter_link"

  GOOGLE_PLUS_LINK_IL = "//span[contains(@class, 'fa-google-plus')]"
  GOOGLE_PLUS_LINK_TA = "sencha:admin_dashboard_ext_js:google_plus_link"

  EMAIL_SOCIAL_LINK_IL = "(//span[contains(@class, 'fa-envelope')])[2]"
  EMAIL_SOCIAL_LINK_TA = "sencha:admin_dashboard_ext_js:email_social_link"

  FOLLOW_BTN_IL = "//span[text()='Follow']"
  FOLLOW_BTN_TA = "sencha:admin_dashboard_ext_js:follow_btn"

  RESOLUTION_IMAGES_IL = "//div[text()='How can I access high resolution images?']"
  RESOLUTION_IMAGES_TA = "sencha:admin_dashboard_ext_js:resolution_images"

  RESOLUTION_IMAGES_BODY_IL = "(//div[@class='x-autocontainer-innerCt'])[5]"
  RESOLUTION_IMAGES_BODY_TA = "sencha:admin_dashboard_ext_js:resolution_images_body"

  APPLICATION_PC_IL = "//div[text()='Can I download the application on my PC?']"
  APPLICATION_PC_TA = "sencha:admin_dashboard_ext_js:application_pc"

  APPLICATION_PC_BODY_IL = "(//div[@class='x-autocontainer-innerCt'])[6]"
  APPLICATION_PC_BODY_TA = "sencha:admin_dashboard_ext_js:application_pc_body"

  DATABASE_UPDATE_IL = "//div[text()='How often does the database get updated?']"
  DATABASE_UPDATE_TA = "sencha:admin_dashboard_ext_js:database_update"

  DATABASE_UPDATE_BODY_IL = "(//div[@class='x-autocontainer-innerCt'])[7]"
  DATABASE_UPDATE_BODY_TA = "sencha:admin_dashboard_ext_js:database_update_body"

  COMMERCIAL_WEBSITE_IL = "//div[text()='Can I use the downloaded images on a commercial website?']"
  COMMERCIAL_WEBSITE_TA = "sencha:admin_dashboard_ext_js:commercial_website"

  COMMERCIAL_WEBSITE_BODY_IL = "(//div[@class='x-autocontainer-innerCt'])[8]"
  COMMERCIAL_WEBSITE_BODY_TA = "sencha:admin_dashboard_ext_js:commercial_website_body"

  FORMS_USERNAME_IL = "(//input[@placeholder='Username must be unique.'])[2]"
  FORMS_USERNAME_TA = "sencha:admin_dashboard_ext_js:forms_username"

  FORMS_EMAIL_IL = "(//input[@placeholder='ex: me@somewhere.com'])[2]"
  FORMS_EMAIL_TA = "sencha:admin_dashboard_ext_js:forms_email"

  FORMS_PASSWORD_IL = "(//input[@placeholder='Enter a password'])[2]"
  FORMS_PASSWORD_TA = "sencha:admin_dashboard_ext_js:forms_password"

  FORMS_PASSWORD_MATCH_IL = "(//input[@placeholder='Passwords must match'])[2]"
  FORMS_PASSWORD_MATCH_TA = "sencha:admin_dashboard_ext_js:forms_password_match"

  NEXT_BTN_IL = "(//span[text()='Next'])[2]"
  NEXT_BTN_TA = "sencha:admin_dashboard_ext_js:next_btn"

  FORMS_FIRST_NAME_IL = "(//input[@placeholder='First Name'])[2]"
  FORMS_FIRST_NAME_TA = "sencha:admin_dashboard_ext_js:forms_first_name"

  FORMS_LAST_NAME_IL = "(//input[@placeholder='Last Name'])[2]"
  FORMS_LAST_NAME_TA = "sencha:admin_dashboard_ext_js:forms_last_name"

  FORMS_COMPANY_NAME_IL = "(//input[@placeholder='Company'])[2]"
  FORMS_COMPANY_NAME_TA = "sencha:admin_dashboard_ext_js:forms_company_name"

  FORMS_MEMBER_FREE_IL = "(//label[text()='Free'])[2]"
  FORMS_MEMBER_FREE_TA = "sencha:admin_dashboard_ext_js:forms_member_free"

  FORMS_PHONE_NUMBER_IL = "(//input[@placeholder='Phone number'])[2]"
  FORMS_PHONE_NUMBER_TA = "sencha:admin_dashboard_ext_js:forms_phone_number"

  FORMS_ADDRESS_IL = "(//input[@placeholder='Address'])[2]"
  FORMS_ADDRESS_TA = "sencha:admin_dashboard_ext_js:forms_address"

  FORMS_CITY_IL = "(//input[@placeholder='City'])[2]"
  FORMS_CITY_TA = "sencha:admin_dashboard_ext_js:forms_city"

  FORMS_ZIP_IL = "(//input[@placeholder='Postal Code / Zip Code'])[2]"
  FORMS_ZIP_TA = "sencha:admin_dashboard_ext_js:forms_zip"

  FORMS_THANK_YOU_IL = "(//h2[text()='Thank You'])[2]"
  FORMS_THANK_YOU_TA = "sencha:admin_dashboard_ext_js:forms_thank_you"

  LOGIN_PAGE_IL = "//div[text()='Login']"
  LOGIN_PAGE_TA = "sencha:admin_dashboard_ext_js:login_page"

  LOGIN_USER_ID_IL = "//input[@placeholder='user id']"
  LOGIN_USER_ID_TA = "sencha:admin_dashboard_ext_js:login_user_id"

  LOGIN_PASSWORD_IL = "//input[@placeholder='Password']"
  LOGIN_PASSWORD_TA = "sencha:admin_dashboard_ext_js:login_password"

  LOGIN_LOGIN_IL = "//input[@placeholder='Password']"
  LOGIN_LOGIN_TA = "sencha:admin_dashboard_ext_js:login_login"


  def should_see_dashboard_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: DASHBOARD_MENU_TA, il: DASHBOARD_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_email_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EMAIL_MENU_TA, il: EMAIL_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_profile_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: PROFILE_MENU_TA, il: PROFILE_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_search_results_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: SEARCH_RESULTS_MENU_TA, il: SEARCH_RESULTS_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_faq_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FAQ_MENU_TA, il: FAQ_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_pages_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PAGES_MENU_TA, il: PAGES_MENU_IL, check_path: $check_path).click
    end
  end

  def should_see_blank_page_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: BLANK_PAGE_MENU_TA, il: BLANK_PAGE_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_error_404_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: ERROR_404_MENU_TA, il: ERROR_404_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_error_500_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: ERROR_500_MENU_TA, il: ERROR_500_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_widgets_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: WIDGETS_MENU_TA, il: WIDGETS_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_forms_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FORMS_MENU_TA, il: FORMS_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_charts_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: CHARTS_MENU_TA, il: CHARTS_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_hamburger_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: HAMBURGER_MENU_TA, il: HAMBURGER_MENU_IL, check_path: $check_path).click
    end
  end

  def click_mobile_switch_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: MOBILE_SWITCH_TA, il: MOBILE_SWITCH_IL, check_path: $check_path).click
    end
  end

  def click_switch_mobile_no(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SWITCH_MODERN_NO_TA, il: SWITCH_MODERN_NO_IL, check_path: $check_path).click
    end
  end

  def should_see_search_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: SEARCH_LINK_TA, il: SEARCH_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_email_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EMAIL_LINK_TA, il: EMAIL_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_faq_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FAQ_LINK_TA, il: FAQ_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_profile_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: PROFILE_LINK_TA, il: PROFILE_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_first_todo_item(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FIRST_TODO_TA, il: FIRST_TODO_IL, check_path: $check_path).click
    end
  end

  def fill_new_task_field(key = nil, new_task)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: NEW_TASK_TA, il: NEW_TASK_IL, check_path: $check_path).set(new_task)
    end
  end

  def click_add_new_task(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ADD_TASK_TA, il: ADD_TASK_IL, check_path: $check_path).click
    end
  end

  def click_email_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: EMAIL_MENU_TA, il: EMAIL_MENU_IL, check_path: $check_path).click
    end
  end

  def click_compose_link(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: COMPOSE_LINK_TA, il: COMPOSE_LINK_IL, check_path: $check_path).click
    end
  end

  def click_discard_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: DISCARD_BTN_TA, il: DISCARD_BTN_IL, check_path: $check_path).click
    end
  end

  def should_see_inbox_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: INBOX_LINK_TA, il: INBOX_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_sent_mail_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: SENT_MAIL_LINK_TA, il: SENT_MAIL_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_torres_tran_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: TORRES_TRAN_LINK_TA, il: TORRES_TRAN_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_hines_moon_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HINES_MOON_LINK_TA, il: HINES_MOON_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_molina_wilkerson_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: MOLINA_WILKERSON_LINK_TA, il: MOLINA_WILKERSON_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_six_person(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SIX_PERSON_TA, il: SIX_PERSON_IL, check_path: $check_path).click
    end
  end

  def click_six_person_petty_caldwell(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SIX_PERSON_PETTY_CALDWELL_TA, il: SIX_PERSON_PETTY_CALDWELL_IL, check_path: $check_path).click
    end
  end

  def should_see_trash_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: TRASH_LINK_TA, il: TRASH_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_exclamation_circle_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EXCLAMATION_CIRCLE_LINK_TA, il: EXCLAMATION_CIRCLE_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_print_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: PRINT_LINK_TA, il: PRINT_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_edit_bold_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EDIN_BOLD_LINK_TA, il: EDIN_BOLD_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_edit_italic_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EDIN_ITALIC_LINK_TA, il: EDIN_ITALIC_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_edit_underline_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EDIN_UNDERLINE_LINK_TA, il: EDIN_UNDERLINE_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_profile_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PROFILE_MENU_TA, il: PROFILE_MENU_IL, check_path: $check_path).click
    end
  end

  def fill_your_mind_field(key = nil, your_mind)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: YOUR_MIND_TEXTAREA_TA, il: YOUR_MIND_TEXTAREA_IL, check_path: $check_path).set(your_mind)
    end
  end

  def click_share_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SHARE_BTN_TA, il: SHARE_BTN_IL, check_path: $check_path).click
    end
  end

  def should_see_video_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: VIDEO_LINK_TA, il: VIDEO_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_camera_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: CAMERA_LINK_TA, il: CAMERA_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_file_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FILE_LINK_TA, il: FILE_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_facebook_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FACEBOOK_LINK_TA, il: FACEBOOK_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_twitter_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: TWITTER_LINK_TA, il: TWITTER_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_google_plus_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: GOOGLE_PLUS_LINK_TA, il: GOOGLE_PLUS_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_email_social_link(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: EMAIL_SOCIAL_LINK_TA, il: EMAIL_SOCIAL_LINK_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_follow_btn(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FOLLOW_BTN_TA, il: FOLLOW_BTN_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_faq_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FAQ_MENU_TA, il: FAQ_MENU_IL, check_path: $check_path).click
    end
  end

  def should_see_resolution_images(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: RESOLUTION_IMAGES_TA, il: RESOLUTION_IMAGES_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_resolution_images_body(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: RESOLUTION_IMAGES_BODY_TA, il: RESOLUTION_IMAGES_BODY_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_application_pc(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: APPLICATION_PC_TA, il: APPLICATION_PC_IL, check_path: $check_path).click
    end
  end

  def should_see_application_pc_body(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: APPLICATION_PC_BODY_TA, il: APPLICATION_PC_BODY_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_database_update(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: DATABASE_UPDATE_TA, il: DATABASE_UPDATE_IL, check_path: $check_path).click
    end
  end

  def should_see_database_update_body(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: DATABASE_UPDATE_BODY_TA, il: DATABASE_UPDATE_BODY_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_commercial_website(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: COMMERCIAL_WEBSITE_TA, il: COMMERCIAL_WEBSITE_IL, check_path: $check_path).click
    end
  end

  def should_see_commercial_website_body(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: COMMERCIAL_WEBSITE_BODY_TA, il: COMMERCIAL_WEBSITE_BODY_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_forms_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_MENU_TA, il: FORMS_MENU_IL, check_path: $check_path).click
    end
  end

  def fill_forms_username_field(key = nil, username)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_USERNAME_TA, il: FORMS_USERNAME_IL, check_path: $check_path).set(username)
    end
  end

  def fill_forms_email_field(key = nil, email)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_EMAIL_TA, il: FORMS_EMAIL_IL, check_path: $check_path).set(email)
    end
  end

  def fill_forms_password_field(key = nil, password)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_PASSWORD_TA, il: FORMS_PASSWORD_IL, check_path: $check_path).set(password)
    end
  end

  def fill_forms_re_password_field(key = nil, re_password)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_PASSWORD_MATCH_TA, il: FORMS_PASSWORD_MATCH_IL, check_path: $check_path).set(re_password)
    end
  end

  def click_next_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: NEXT_BTN_TA, il: NEXT_BTN_IL, check_path: $check_path).click
    end
  end

  def fill_forms_first_name_field(key = nil, first_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_FIRST_NAME_TA, il: FORMS_FIRST_NAME_IL, check_path: $check_path).set(first_name)
    end
  end

  def fill_forms_last_name_field(key = nil, last_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_LAST_NAME_TA, il: FORMS_LAST_NAME_IL, check_path: $check_path).set(last_name)
    end
  end

  def fill_forms_company_name_field(key = nil, company_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_COMPANY_NAME_TA, il: FORMS_COMPANY_NAME_IL, check_path: $check_path).set(company_name)
    end
  end

  def click_member_free(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_MEMBER_FREE_TA, il: FORMS_MEMBER_FREE_IL, check_path: $check_path).click
    end
  end

  def fill_forms_phone_number_field(key = nil, phone_number)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_PHONE_NUMBER_TA, il: FORMS_PHONE_NUMBER_IL, check_path: $check_path).set(phone_number)
    end
  end

  def fill_forms_address_field(key = nil, address)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_ADDRESS_TA, il: FORMS_ADDRESS_IL, check_path: $check_path).set(address)
    end
  end

  def fill_forms_city_field(key = nil, city)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_CITY_TA, il: FORMS_CITY_IL, check_path: $check_path).set(city)
    end
  end

  def fill_forms_zip_field(key = nil, zip)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORMS_ZIP_TA, il: FORMS_ZIP_IL, check_path: $check_path).set(zip)
    end
  end

  def should_see_forms_thank_you(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: FORMS_THANK_YOU_TA, il: FORMS_THANK_YOU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_login_page(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: LOGIN_PAGE_TA, il: LOGIN_PAGE_IL, check_path: $check_path).click
    end
  end

  def fill_login_user_id_field(key = nil, user_id)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: LOGIN_USER_ID_TA, il: LOGIN_USER_ID_IL, check_path: $check_path).set(user_id)
    end
  end

  def fill_login_password_field(key = nil, password)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: LOGIN_PASSWORD_TA, il: LOGIN_PASSWORD_IL, check_path: $check_path).set(password)
    end
  end

  def click_login_login_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: LOGIN_LOGIN_TA, il: LOGIN_LOGIN_IL, check_path: $check_path).click
    end
  end

end
