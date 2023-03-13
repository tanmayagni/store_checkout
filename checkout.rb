require 'byebug'

class Checkout
  PRICING_RULES = {
    'VOUCHER' => { type: :two_for_one },
    'TSHIRT' => { type: :bulk_discount, threshold: 3, discounted_price: 19.00 }
  }

  PRODUCTS = {
    'VOUCHER' => { name: 'Voucher', price: 5.00 },
    'TSHIRT' => { name: 'T-Shirt', price: 20.00 },
    'MUG' => { name: 'Coffee Mug', price: 7.50 }
  }

  def initialize()
    @pricing_rules = PRICING_RULES
    @items = []
  end

  def scan(item_code)
    @items << item_code
  end

  def display_item_list
    @items.to_a
  end

  def total
    total_price = 0.0
    item_counts = @items.tally

    item_counts.each do |item_code, count|
      product = PRODUCTS[item_code]
      item_price = product[:price]

      # Check if there are any pricing rules for this product
      if @pricing_rules[item_code]
        rule = @pricing_rules[item_code]

        if rule[:type] == :two_for_one
          # Apply 2-for-1 pricing rule
          discounted_count = count / 2 + count % 2
          item_price = discounted_count * product[:price]
        elsif rule[:type] == :bulk_discount
          # Apply bulk discount pricing rule
          if count >= rule[:threshold]
            item_price = count * rule[:discounted_price]
          end
        end
      end

      total_price += item_price
    end

    total_price
  end

  def destroy_item_list
    @items = []
  end
end
