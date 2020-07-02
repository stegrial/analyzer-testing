require 'spec_helper'
require_relative '../page_extension'

class CustomerCarePage < PageExtension

  def should_see_link(key = nil, name)
    element = find_element(key, il_type: :xpath, tl: "venus:customer_care:link:#{ta_name(name)}", il: "//a[text()='#{name}']", check_path: $check_path)
    expect(element).to be_visible
  end

end






