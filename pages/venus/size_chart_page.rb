require 'spec_helper'
require_relative '../page_extension'

class SizeChartPage < PageExtension

  def should_see_sizes_table(key = nil, header_name)
    element = find_element(key, il_type: :xpath, tl: "venus:size_chart:sizes_table:#{ta_name(header_name)}",
                           il: "//h2[text()='#{header_name}:']/following::table[1]", check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_video(key = nil)
    element = find_element(key, il_type: :css, tl: "venus:size_chart:video", il: "video", check_path: $check_path)
    expect(element).to be_visible
  end

end






