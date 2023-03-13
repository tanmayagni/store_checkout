# Checkout System with Pricing Rules

- Required ruby version : ruby-3.2.0
- Run Bundle install to install required dependencies

## About project
  This is a simple implementation of a checkout system that applies pricing rules for specific products. The implementation is written in Ruby.

## Features
  - Scan items to add them to the list of items being checked out.
  - Display the list of items that have been scanned.
  - Calculate the total price of all items scanned, applying any applicable pricing rules.
  - Destroy the list of items that have been scanned.

## Products
  The products that can be scanned are defined in the PRODUCTS constant hash. Each product is defined by an item_code, a name, and a price. Currently, the checkout system supports three products: 'VOUCHER', 'TSHIRT', and 'MUG'.

## Usage
  To use the checkout system, you can create a new instance of the Checkout class and call its methods. Here's an example:

  ### Create a new checkout object
    co = Checkout.new
    
    Scan some items
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('MUG')
    
    Display the list of scanned items
      puts co.display_item_list
      
    Calculate the total price
      puts co.total
      
    Destroy the list of scanned items
      co.destroy_item_list

  This example will scan three items and display the list of scanned items. Then, it will calculate the total price of the items, applying any applicable pricing rules. Finally, it will destroy the list of scanned items.

## To run the product.rb file in terminal
    -> ruby main.rb

## To run the test case
    -> rspec spec/checkout_spec.rb

