class GoldRange
  attr_reader :type, :range, :size, :material, :products, :price
  attr_accessor :amount

  def initialize type, range, size, material, amount
    @type = type
    @range = range
    @size = size
    @material = material
    @amount = amount
    @price = nil

    @products = {
      'front' => {
        '8x7ft' => {'softwood' => 1210, 'plastic' => 1539},
        '10x7ft' => {'softwood' => 1337, 'plastic' => 1699},
        '12x7ft' => {'softwood' => 1462, 'plastic' => 1859},
        '14x7ft' => {'softwood' => 1572, 'plastic' => 1999}
      },
      'divider' => {
        '8x7ft' => {'softwood' => 943, 'plastic' => 1319},
        '10x7ft' => {'softwood' => 986, 'plastic' => 1379},
        '12x7ft' => {'softwood' => 1029, 'plastic' => 1439},
        '14x7ft' => {'softwood' => 1072, 'plastic' => 1499},
      },
      'double infill divider' => {
        '8x7ft' => {'softwood' => 578, 'plastic' => 808},
        '10x7ft' => {'softwood' => 695, 'plastic' => 972},
        '12x7ft' => {'softwood' => 795, 'plastic' => 1112},
        '14x7ft' => {'softwood' => 894, 'plastic' => 1251},
      }
    }
  end

  def count
    @price = products[type][size][material] * amount

    display_price
  end

  def display_price
    net_price = (price / 1.2).round(2)
    vat = (price - net_price).round(2)
    puts "\nPrice for #{amount}X #{range.upcase} #{type.upcase} #{size} made of #{material.upcase} is:\nGROSS: #{price} NET: #{net_price} VAT: #{vat}"
  end
end