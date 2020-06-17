require_relative '../page_extension'

class CovidPage < PageExtension


  COVID_19_IL = "//div[@id='nav-main']//a[contains(text(), 'COVID-19')]"
  COVID_19_TA = "amazon:covid_page:covid_19"

  COVID_19_PAGE_IL = "//h1[contains(text(), 'COVID-19')]"
  COVID_19_PAGE_TA = "amazon:covid_page:covid_19_page"

  HAMBURGER_MENU_IL = "//button[contains(@class, 'header-menuToggle')]"
  HAMBURGER_MENU_TA = "amazon:covid_page:hamburger_menu"

  BOOKS_AND_AUTHORS_IL = "//div[@class='NavigationItem-text']/a[text()='Books and authors']"
  BOOKS_AND_AUTHORS_TA = "amazon:covid_page:books_and_author"

  SUSTAINABILITY_IL = "//div[@class='NavigationItem-text']/a[text()='Sustainability ']"
  SUSTAINABILITY_TA = "amazon:covid_page:sustainability"

  HEADER_LOGO_IL = "(//div[@class='ArticlePage-logo'])[2]//img"
  HEADER_LOGO_TA = "amazon:covid_page:header_logo"

  MENU_CLOSE_BTN_IL = ".ArticlePage-header-menuClose"
  MENU_CLOSE_BTN_TA = "amazon:covid_page:menu_close_btn"

  DATE_IL = ".LeadTwoColumnHomePage-leftColumnItems .LeadTwoColumnHomePage-date"
  DATE_TA =  "amazon:covid_page:date"

  PRIORITIZING_IL = "//a[text()='Prioritizing health and safety']"
  PRIORITIZING_TA = "amazon:covid_page:prioritizing_link"

  OUR_POSITION_IL = "//a[text()='Our Positions']"
  OUR_POSITION_TA = "amazon:covid_page:our_position"

  AMAZON_COVID_BLOG_IL = "//a[contains(text(), 'COVID-19 blog')]"
  AMAZON_COVID_BLOG_TA = "amazon:covid_page:covid_blog_link"

  FACEBOOK_TOP_ICON_IL = "(//a[@title='Facebook Share'])[1]"
  FACEBOOK_TOP_ICON_TA = "amazon:covid_page:Facebook_top_icon"

  LINKEDIN_BOTTOM_ICON_IL = "(//a[@title='Linked In Share'])[2]"
  LINKEDIN_BOTTOM_ICON_TA = "amazon:covid_page:linkedin_bottom_icon"

  POPULAR_TODAY_IL = "//header[text()='Popular Today']"
  POPULAR_TODAY_TA = "amazon:covid_page:popular_today"

  PLAY_FIRST_VIDEO_IL = "//button[contains(@class, 'ytp-large-play-button')]"
  PLAY_FIRST_VIDEO_TA = "amazon:covid_page:play_1st_video"

  IFRAME_IL = "(//iframe[contains(@id, 'YouTubeVideoPlayer')])[1]"
  IFRAME_TA = "amazon:covid_page:iframe_video_1st"

  TAGS_PANEL_IL = ".ArticlePage-tags"
  TAGS_PANEL_TA = "amazon:covid_page:tags_panel"

  LEARN_MORE_BTN_IL = ".PromoBannerTextOverlay-button"
  LEARN_MORE_BTN_TA = "amazon:covid_page:learn_more_btn"


  def click_and_check_covid_19(key = nil)
    if page.has_xpath?("//div[@id='nav-main']//a[contains(text(), 'COVID-19')]")
      find_element(key, il_type: :xpath, tl: COVID_19_TA, il: COVID_19_IL, check_path: $check_path).click
      def should_see_covid_19_page(key = nil)
        element = find_element(key, il_type: :xpath, tl: COVID_19_PAGE_TA, il: COVID_19_PAGE_IL, check_path: $check_path)
        expect(element).to be_visible
      end
    end
  end

  def should_see_books_and_author(key = nil)
    element = find_element(key, il_type: :xpath, tl: BOOKS_AND_AUTHORS_TA, il: BOOKS_AND_AUTHORS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_covid_19_blog(key = nil)
    element = find_element(key, il_type: :xpath, tl: COVID_19_PAGE_TA, il: COVID_19_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_hamburger_menu(key = nil)
    find_element(key, il_type: :xpath, tl: HAMBURGER_MENU_TA, il: HAMBURGER_MENU_IL, check_path: $check_path).click
  end

  def click_sustainability_item(key = nil)
    find_element(key, il_type: :xpath, tl: SUSTAINABILITY_TA, il: SUSTAINABILITY_IL, check_path: $check_path).click
  end

  def click_header_logo(key = nil)
    find_element(key, il_type: :xpath, tl: HEADER_LOGO_TA, il: HEADER_LOGO_IL, check_path: $check_path).click
  end

  def should_see_date_on_page(key = nil)
    element = find_element(key, il_type: :css, tl: DATE_TA, il: DATE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_prioritizing_link(key = nil)
    find_element(key, il_type: :xpath, tl: PRIORITIZING_TA, il: PRIORITIZING_IL, check_path: $check_path).click
  end

  def click_our_position_link(key = nil)
    find_element(key, il_type: :xpath, tl: OUR_POSITION_TA, il: OUR_POSITION_IL, check_path: $check_path).click
  end

  def click_covid_blog_link(key = nil)
    find_element(key, il_type: :xpath, tl: AMAZON_COVID_BLOG_TA, il: AMAZON_COVID_BLOG_IL, check_path: $check_path).click
  end

  def click_facebook_top_icon(key = nil)
    find_element(key, il_type: :xpath, tl: FACEBOOK_TOP_ICON_TA, il: FACEBOOK_TOP_ICON_IL, check_path: $check_path).click
  end

  def click_linkedin_bottom_icon(key = nil)
    find_element(key, il_type: :xpath, tl: LINKEDIN_BOTTOM_ICON_TA, il: LINKEDIN_BOTTOM_ICON_IL, check_path: $check_path).click
  end

  def should_see_popular_today(key = nil)
    element = find_element(key, il_type: :xpath, tl: POPULAR_TODAY_TA, il: POPULAR_TODAY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_play_1st_video(key = nil)
    within_frame( find_element(key, il_type: :xpath, tl: IFRAME_TA, il: IFRAME_IL, check_path: $check_path)) do
      find_element(key, il_type: :xpath, tl: PLAY_FIRST_VIDEO_TA, il: PLAY_FIRST_VIDEO_IL, check_path: $check_path).click
    end
  end

  def should_see_tags_panel(key = nil)
    element = find_element(key, il_type: :css, tl: TAGS_PANEL_TA, il: TAGS_PANEL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_learn_more_btn(key = nil)
    find_element(key, il_type: :css, tl: LEARN_MORE_BTN_TA, il: LEARN_MORE_BTN_IL, check_path: $check_path).click
  end

  def click_menu_close_btn(key = nil)
    find_element(key, il_type: :css, tl: MENU_CLOSE_BTN_TA, il: MENU_CLOSE_BTN_IL, check_path: $check_path).click
  end
end
