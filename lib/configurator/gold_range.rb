class GoldRange
  attr_reader :size, :material
  attr_accessor :amount

  def initialize size, material, amount
    @size = size
    @material = material
    @amount = amount

    @PRODUCTS = {
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
        
      }
    }
  end
end