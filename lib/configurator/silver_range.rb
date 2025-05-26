class SilverRange
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
        '8x7ft' => {'softwood' => 635, 'plastic' => 700},
        '10x7ft' => {'softwood' => 720, 'plastic' => 881},
        '12x7ft' => {'softwood' => 772, 'plastic' => 950},
        '14x7ft' => {'softwood' => 871, 'plastic' => 1089}
      },
      'divider' => {
        '8x7ft' => {'softwood' => 466.20, 'plastic' => 553.77},
        '10x7ft' => {'softwood' => 539.28, 'plastic' => 665.28},
        '12x7ft' => {'softwood' => 607.32, 'plastic' => 761.67},
        '14x7ft' => {'softwood' => 672.84, 'plastic' => 856.17},
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