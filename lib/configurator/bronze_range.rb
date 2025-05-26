class BronzeRange
  attr_reader :size, :material, :type, :products, :price
  attr_accessor :amount
  
  def initialize type, size, material, amount
    @type = type
    @size = size
    @material = material
    @amount = amount
    @price = nil

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
        
      }
    }
  end
end