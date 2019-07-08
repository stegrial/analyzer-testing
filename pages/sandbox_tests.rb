require 'capybara/rspec'
require 'selenium-webdriver'

module SandboxTests

  def initialize(*args)
    @second_heading_il = "//div[@id='div-01']//h4"
    @second_heading_ta = 'sandbox:h4:test_1'

    @h2_video_il = "//article[@id='embedded__video']//h2[text()='Video']"
    @h2_video_ta = 'sandbox:html5:articleVideo:h2'
    super
  end

  def record_heading_4(key = nil)
    return find(:xpath, @second_heading_il) if key == :il
    find(:xpath, ta(@second_heading_ta, @second_heading_il))
  end

  def record_h2_video(key = nil)
    return find(:xpath, @second_heading_il) if key == :il
    find(:xpath, ta(@h2_video_ta, @h2_video_il))
  end


end