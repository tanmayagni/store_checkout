require './checkout'

RSpec.describe Checkout do
  let(:checkout) { Checkout.new }

  describe '#scan' do
    it 'adds an item code to the item list' do
      checkout.scan('VOUCHER')
      expect(checkout.display_item_list).to eq ['VOUCHER']
    end
  end

  describe '#total' do
    context 'when no pricing rules are applied' do
      it 'returns the total price of all items' do
        checkout.scan('VOUCHER')
        checkout.scan('TSHIRT')
        checkout.scan('MUG')
        expect(checkout.total).to eq 32.50
      end
    end

    context 'when a 2-for-1 pricing rule is applied' do
      it 'applies the rule and returns the discounted price' do
        checkout.scan('VOUCHER')
        checkout.scan('VOUCHER')
        checkout.scan('VOUCHER')
        expect(checkout.total).to eq 10.00
      end
    end

    context 'when a bulk discount pricing rule is applied' do
      it 'applies the rule and returns the discounted price' do
        checkout.scan('TSHIRT')
        checkout.scan('TSHIRT')
        checkout.scan('TSHIRT')
        checkout.scan('TSHIRT')
        expect(checkout.total).to eq 76.00
      end
    end

    context 'when a multiple pricing rule is applied' do
      it 'applies the rule and returns the discounted price' do
        checkout.scan("VOUCHER")
        checkout.scan("TSHIRT")
        checkout.scan("VOUCHER")
        checkout.scan("VOUCHER")
        checkout.scan("MUG")
        checkout.scan("TSHIRT")
        checkout.scan("TSHIRT")
        checkout.scan("TSHIRT")
        checkout.scan("VOUCHER")
        expect(checkout.total).to eq 93.50
      end
    end
  end

  describe '#destroy_item_list' do
    it 'clears the item list' do
      checkout.scan('VOUCHER')
      checkout.scan('TSHIRT')
      checkout.destroy_item_list
      expect(checkout.display_item_list).to be_empty
    end
  end
end
