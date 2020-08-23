require_relative '../page_extension'

class ExecutiveDashboardExtJSPage < PageExtension

  MY_BIZ_TITLE_IL = "//div[text()='MyBiz']"
  MY_BIZ_TITLE_TA = "sencha:executive_dashboard_ext_js:title_my_biz"

  KPI_OVERVIEW_MENU_IL = "//span[text()='KPI Overview']"
  KPI_OVERVIEW_MENU_TA = "sencha:executive_dashboard_ext_js:kpi_overview_menu"

  GOALS_MET_BUTTON_IL = "//span[text()='GOALS MET']"
  GOALS_MET_BUTTON_TA = "sencha:executive_dashboard_ext_js:goals_met_button"

  SALES_BUTTON_IL = "//span[text()='SALES']"
  SALES_BUTTON_TA = "sencha:executive_dashboard_ext_js:sales_button"

  WON_BUTTON_IL = "//span[text()='WON']"
  WON_BUTTON_TA = "sencha:executive_dashboard_ext_js:won_button"

  CLICKS_BUTTON_IL = "//span[text()='CLICKS']"
  CLICKS_BUTTON_TA = "sencha:executive_dashboard_ext_js:clicks_button"

  PERFORMANCE_MENU_IL = "//span[text()='Performance']"
  PERFORMANCE_MENU_TA = "sencha:executive_dashboard_ext_js:performance_menu"

  APPL_DROPDOWN_IL = "//span[text()='AAPL']"
  APPL_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:appl_dropdown"

  GOOGLE_TEXT_IL = "//div[text()='GOOGLE, INC']"
  GOOGLE_TEXT_TA = "sencha:executive_dashboard_ext_js:google_text"

  GOOG_DROPDOWN_IL = "//span[text()='GOOG']"
  GOOG_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:google_dropdown"

  APPLE_TEXT_IL = "//div[text()='APPLE, INC']"
  APPLE_TEXT_TA = "sencha:executive_dashboard_ext_js:appl_text"

  STATEMENTS_4_2013_IL = "//div[text()='QUARTERLY STATEMENT 4 2013']"
  STATEMENTS_4_2013_TA = "sencha:executive_dashboard_ext_js:statements_4_2013"

  PROFIT_LOSS_MENU_IL = "//span[text()='Profit & Loss']"
  PROFIT_LOSS_MENU_TA = "sencha:executive_dashboard_ext_js:profit_and_loss_menu"

  QUARTER_DROPDOWN_IL = "//span[text()='Quarter']"
  QUARTER_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:quarter_dropdown"

  QUARTER_1_2010_IL = "//span[text()='Quarter 1, 2010']"
  QUARTER_1_2010_TA = "sencha:executive_dashboard_ext_js:quarter_1_2010"

  REGION_DROPDOWN_IL = "//span/span[text()='Region']"
  REGION_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:region_dropdown"

  REGION_ASIA_IL = "//span[text()='Asia']"
  REGION_ASIA_TA = "sencha:executive_dashboard_ext_js:region_asia"

  COST_OF_REVENUE_IL = "(//div[@data-groupname='Cost Of Revenue'])[1]"
  COST_OF_REVENUE_TA = "sencha:executive_dashboard_ext_js:cost_of_revenue_asia"

  DISCONTINUED_OPERATIONS_IL = "(//div[@data-groupname='Discontinued Operations'])[1]"
  DISCONTINUED_OPERATIONS_TA = "sencha:executive_dashboard_ext_js:discontinued_operations"

  COMPANY_NEWS_MENU_IL = "//span[text()='Company News']"
  COMPANY_NEWS_MENU_TA = "sencha:executive_dashboard_ext_js:company_news_menu"

  ALL_POSTS_DROPDOWN_IL = "//span/span[text()='All Posts']"
  ALL_POSTS_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:all_posts_dropdown"

  NEWS_DROPDOWN_IL = "//span/span[text()='News']"
  NEWS_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:news_dropdown"

  FORUM_DROPDOWN_IL = "//span/span[text()='Forum']"
  FORUM_DROPDOWN_TA = "sencha:executive_dashboard_ext_js:forum_dropdown"

  NEWS_ICON_IL = "(//div[contains(@class, 'news-icon')])[2]"
  NEWS_ICON_TA = "sencha:executive_dashboard_ext_js:forum_icon"

  EXPAND_2_IL = "(//div[contains(@class, 'expand')])[3]"
  EXPAND_2_TA = "sencha:executive_dashboard_ext_js:expand_2"

  COLLAPSE_2_IL = "(//div[contains(@class, 'collapse')])[2]"
  COLLAPSE_2_TA = "sencha:executive_dashboard_ext_js:collapse_2"


  def should_see_my_biz_title(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: MY_BIZ_TITLE_TA, il: MY_BIZ_TITLE_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def should_see_kpi_overview_menu(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: KPI_OVERVIEW_MENU_TA, il: KPI_OVERVIEW_MENU_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_goals_met_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: GOALS_MET_BUTTON_TA, il: GOALS_MET_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_sales_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SALES_BUTTON_TA, il: SALES_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_won_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: WON_BUTTON_TA, il: WON_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_clicks_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CLICKS_BUTTON_TA, il: CLICKS_BUTTON_IL, check_path: $check_path).click
    end
  end

  def click_performance_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PERFORMANCE_MENU_TA, il: PERFORMANCE_MENU_IL, check_path: $check_path).click
    end
  end

  def click_appl_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: APPL_DROPDOWN_TA, il: APPL_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def should_see_google_text(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: GOOGLE_TEXT_TA, il: GOOGLE_TEXT_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_google_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: GOOG_DROPDOWN_TA, il: GOOG_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def should_see_appl_text(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: APPLE_TEXT_TA, il: APPLE_TEXT_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

  def click_statements_4_2013(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: STATEMENTS_4_2013_TA, il: STATEMENTS_4_2013_IL, check_path: $check_path).click
    end
  end

  def click_profit_loss_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PROFIT_LOSS_MENU_TA, il: PROFIT_LOSS_MENU_IL, check_path: $check_path).click
    end
  end

  def click_quarter_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: QUARTER_DROPDOWN_TA, il: QUARTER_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def click_quarter_1_2010(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: QUARTER_1_2010_TA, il: QUARTER_1_2010_IL, check_path: $check_path).click
    end
  end

  def hover_region_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: REGION_DROPDOWN_TA, il: REGION_DROPDOWN_IL, check_path: $check_path).hover
    end
  end

  def click_region_asia(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: REGION_ASIA_TA, il: REGION_ASIA_IL, check_path: $check_path).click
    end
  end

  def click_cost_of_revenue(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: COST_OF_REVENUE_TA, il: COST_OF_REVENUE_IL, check_path: $check_path).click
    end
  end

  def click_discontinued_operations(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: DISCONTINUED_OPERATIONS_TA, il: DISCONTINUED_OPERATIONS_IL, check_path: $check_path).click
    end
  end

  def click_company_news_menu(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: COMPANY_NEWS_MENU_TA, il: COMPANY_NEWS_MENU_IL, check_path: $check_path).click
    end
  end

  def click_all_posts_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ALL_POSTS_DROPDOWN_TA, il: ALL_POSTS_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def click_news_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: NEWS_DROPDOWN_TA, il: NEWS_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def click_forum_dropdown(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: FORUM_DROPDOWN_TA, il: FORUM_DROPDOWN_IL, check_path: $check_path).click
    end
  end

  def click_news_icon(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: NEWS_ICON_TA, il: NEWS_ICON_IL, check_path: $check_path).click
    end
  end

  def click_expand_2(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: EXPAND_2_TA, il: EXPAND_2_IL, check_path: $check_path).click
    end
  end

  def click_collapse_2(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: COLLAPSE_2_TA, il: COLLAPSE_2_IL, check_path: $check_path).click
    end
  end

end
