# Run Tests

* Run all elements recording scenarios:

```
rspec spec/scope/planetblue/*.rb 
```

UNDEFINED
.All elements were deleted
Stopping TrueAutomation.IO Client with pid 47867


Failures:

  1) Preconditions Planet Blue - Filter Products Recording Locators
     Failure/Error: planetblue.select_from_refine_dropdown section, values
     
     NoMethodError:
       undefined method `click' for nil:NilClass
     # ./pages/planetblue/planetblue.rb:71:in `select_from_refine_dropdown'
     # ./spec/scope/planetblue/planetblue_filter_products_spec.rb:47:in `block (5 levels) in <top (required)>'
     # ./helpers/special_methods.rb:7:in `step'
     # ./spec/scope/planetblue/planetblue_filter_products_spec.rb:45:in `block (4 levels) in <top (required)>'

  2) Preconditions Planet Blue - Navigate to Careers Recording Locators
     Failure/Error: careers.should_see_careers_header
       Element is not visible on the page
     # ./pages/planetblue/careers.rb:10:in `should_see_careers_header'
     # ./spec/scope/planetblue/planetblue_navigate_to_careers_spec.rb:32:in `block (5 levels) in <top (required)>'
     # ./helpers/special_methods.rb:7:in `step'
     # ./spec/scope/planetblue/planetblue_navigate_to_careers_spec.rb:31:in `block (4 levels) in <top (required)>'

  3) Preconditions Planet Blue - Find Product Details Recording Locators
     Failure/Error: product_details.should_see_social_share_button button
       Element is not visible on the page
     # ./pages/planetblue/product_details.rb:166:in `should_see_social_share_button'
     # ./spec/scope/planetblue/planetblue_navigate_to_product_details_spec.rb:104:in `block (6 levels) in <top (required)>'
     # ./spec/scope/planetblue/planetblue_navigate_to_product_details_spec.rb:103:in `each'
     # ./spec/scope/planetblue/planetblue_navigate_to_product_details_spec.rb:103:in `block (5 levels) in <top (required)>'
     # ./helpers/special_methods.rb:7:in `step'
     # ./spec/scope/planetblue/planetblue_navigate_to_product_details_spec.rb:102:in `block (4 levels) in <top (required)>'

  4) Preconditions Planet Blue - Scroll Products Recording Locators
     Failure/Error: planetblue.click_load_more_button
     
     NoMethodError:
       undefined method `click' for nil:NilClass
     # ./pages/planetblue/planetblue.rb:151:in `click_load_more_button'
     # ./spec/scope/planetblue/planetblue_scroll_products_spec.rb:59:in `block (5 levels) in <top (required)>'
     # ./helpers/special_methods.rb:7:in `step'
     # ./spec/scope/planetblue/planetblue_scroll_products_spec.rb:58:in `block (4 levels) in <top (required)>'

Finished in 12 minutes 19 seconds (files took 0.40189 seconds to load)
14 examples, 4 failures

