class BronzeRange
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
        '8x7ft' => {'softwood' => 493.92, 'plastic' => 544.32},
        '10x7ft' => {'softwood' => 559.44, 'plastic' => 684.18},
        '12x7ft' => {'softwood' => 630, 'plastic' => 774.90},
        '14x7ft' => {'softwood' => 710.64, 'plastic' => 888.30}
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
    @net_price = (price / 1.2).round(2)
    @vat = (price - net_price).round(2)
    puts "\nPrice for #{amount}X #{range.upcase} #{type.upcase} #{size} made of #{material.upcase} is:\nGROSS: #{price} NET: #{net_price} VAT: #{vat}"
  end
end