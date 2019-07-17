require 'spec_helper'

class SandboxTests

  SECOND_HEADING_IL = "//div[@id='div-01']//h4"
  SECOND_HEADING_TA = 'sandbox:h4:test_1'

  H2_VIDEO_IL = "//article[@id='embedded__video']//h2[text()='Video']"
  H2_VIDEO_TA = 'sandbox:html5:articleVideo:h2'

  def record_heading_4(key = nil)
    return find(:xpath, SECOND_HEADING_IL) if key == :il
    find(:xpath, ta(SECOND_HEADING_TA, SECOND_HEADING_IL))
  end

  def record_h2_video(key = nil)
    return find(:xpath, H2_VIDEO_IL) if key == :il
    find(:xpath, ta(H2_VIDEO_TA, H2_VIDEO_IL))
  end


end