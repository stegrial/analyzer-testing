require_relative '../page_extension'

class DemoPage < PageExtension
  # external site - the calendar is not part of the https://trueautomation.io site

  LIVE_DEMO_TEXT_IL = "//h1[contains(text(), 'TrueAutomation.IO live demo')]"
  LIVE_DEMO_TEXT_TA = 'ta:demo_page:live_demo_text'


  def should_see_live_demo_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: LIVE_DEMO_TEXT_TA, il: LIVE_DEMO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
