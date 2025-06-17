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
        '8x7ft' => {'softwood' => 493.92, 'plastic' => 598.75},
        '10x7ft' => {'softwood' => 559.44, 'plastic' => 752.60},
        '12x7ft' => {'softwood' => 630, 'plastic' => 852.39},
        '14x7ft' => {'softwood' => 710.64, 'plastic' => 977.13}
      },
      'divider' => {
        '8x7ft' => {'softwood' => 466.20, 'plastic' => 609.15},
        '10x7ft' => {'softwood' => 539.28, 'plastic' => 731.81},
        '12x7ft' => {'softwood' => 607.32, 'plastic' => 837.84},
        '14x7ft' => {'softwood' => 672.84, 'plastic' => 941.79},
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