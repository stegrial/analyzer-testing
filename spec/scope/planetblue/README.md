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
- purchase product if logged in
- find products with sale label (and check discount price)
- navigate to new products using link on main page
- find accessories details
- scroll Festival Fever section until reach the 'load more' button
- add item to whishlist and check whishlist
- visit accessibility statement page
- change shipping country and currency
- leave review and check reviews
- visit students discounts
- visit all customer care links in a footer
- visit all support links in the a footer
