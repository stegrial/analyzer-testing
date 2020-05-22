# Run Tests

* Run all elements recording scenarios:

```
rspec spec/scope/planetblue/*.rb --tag=record
```

* Run only one test with elements recording scenario:

```
rspec spec/scope/planetblue/planetblue_find_product_spec.rb --tag=record
```

* Run only one test with elements search scenario:

```
rspec spec/scope/planetblue/planetblue_find_product_spec.rb --tag=search
```

---
```
TODO fixes:
- finish careers test
- add search scenarios
```

```
TODO tests:
rspec ./spec/scope/planetblue/planetblue_add_item_to_whishlist.rb:24 # Preconditions Planet Blue - Add item to whishlist Recording Locators
rspec ./spec/scope/planetblue/planetblue_filter_products_spec.rb:20 # Preconditions Planet Blue - Filter Products Recording Locators
rspec ./spec/scope/planetblue/planetblue_navigate_to_product_details_spec.rb:20 # Preconditions Planet Blue - Find Product Details Recording Locators
rspec ./spec/scope/planetblue/planetblue_scroll_products_spec.rb:19 # Preconditions Planet Blue - Scroll Products Recording Locators
rspec ./spec/scope/planetblue/planetblue_sort_products_spec.rb:20 # Preconditions Planet Blue - Sort Products Recording Locators

