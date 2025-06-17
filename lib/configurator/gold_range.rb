class GoldRange
  attr_reader :type, :range, :size, :material, :products, :price, :net_price, :vat
  attr_accessor :amount

  def initialize type, range, size, material, amount
    @type = type
    @range = range
    @size = size
    @material = material
    @amount = amount
    @price = nil
    @net_price = nil
    @vat = nil

    @products = {
      'front' => {
        '8x7ft' => {'softwood' => 1028.50, 'plastic' => 1438.97},
        '10x7ft' => {'softwood' => 1136.45, 'plastic' => 1588.57},
        '12x7ft' => {'softwood' => 1242.70, 'plastic' => 1738.16},
        '14x7ft' => {'softwood' => 1336.20, 'plastic' => 1869.07}
      },
      'divider' => {
        '8x7ft' => {'softwood' => 801.55, 'plastic' => 1233.27},
        '10x7ft' => {'softwood' => 838.10, 'plastic' => 1289.37},
        '12x7ft' => {'softwood' => 874.65, 'plastic' => 1345.47},
        '14x7ft' => {'softwood' => 911.20, 'plastic' => 1401.57},
      },
      'double infill divider' => {
        '8x7ft' => {'softwood' => 578, 'plastic' => 888.80},
        '10x7ft' => {'softwood' => 695, 'plastic' => 1069.20},
        '12x7ft' => {'softwood' => 795, 'plastic' => 1223.20},
        '14x7ft' => {'softwood' => 894, 'plastic' => 1376.10},
      }
    }
  end

  def count
    @price = products[type][size][material] * amount

    display_price
  end

  def display_price
    @net_price = (price / 1.2).round(2)
    @vat = (price - net_price).round(2)
    puts "\nPrice for #{amount}X #{range.upcase} #{type.upcase} #{size} made of #{material.upcase} is:\nGROSS: #{price} NET: #{net_price} VAT: #{vat}"
  end
end