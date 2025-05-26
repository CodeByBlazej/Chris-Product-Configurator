class SilverRange
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
        
      }
    }
  end
end