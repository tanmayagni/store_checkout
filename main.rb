require_relative 'checkout'

co = Checkout.new()

# Scan items
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("MUG")

# Calculate total price
price = co.total
puts "Item list: #{ co.display_item_list }"
puts "Total price: #{price}" # Total price: 32.50 $
co.destroy_item_list

# Scan more items
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("VOUCHER")

# Calculate total price
price = co.total
puts "Item list: #{ co.display_item_list }"
puts "Total price: #{price}" # Total price: 25.00 $
co.destroy_item_list

# Scan more items
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("TSHIRT")

# Calculate total price
price = co.total
puts "Item list: #{ co.display_item_list }"
puts "Total price: #{price}" # Total price: 81.00 $
co.destroy_item_list

# Scan more items
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("MUG")
co.scan("TSHIRT")
co.scan("TSHIRT")

# Calculate total price
price = co.total
puts "Item list: #{ co.display_item_list }"
puts "Total price: #{price}" # Total price: 74.50 $
co.destroy_item_list

# Scan more items
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("MUG")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("VOUCHER")

# Calculate total price
price = co.total
puts "Item list: #{ co.display_item_list }"
puts "Total price: #{price}" # Total price: 93.50 $

