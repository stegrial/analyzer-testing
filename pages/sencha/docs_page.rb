require_relative '../page_extension'

class DocsPage < PageExtension

  HEADER_DOC_TITLE_IL = "(//a[contains(., 'Sencha Documentation')])[2]"
  HEADER_DOC_TITLE_TA = "sencha:docs_page:header_doc_text"


  def should_see_header_doc_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_DOC_TITLE_TA, il: HEADER_DOC_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
