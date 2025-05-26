class Cart
  attr_reader :basket
  
  def initialize
    @basket = {
      'front' => [],
      'divider' => [],
      'double infill divider' => []
    }
  end

  def display
    print "\nYou have now these items in your basket:\n"
    if any_fronts?
      print "\nFRONTS:\n"
      basket['front'].each { |prod| puts "#{prod.amount}X #{prod.range.upcase} #{prod.size} made of #{prod.material.upcase}" }
    end

    if any_dividers?
      print "\nDIVIDERS:\n"
      basket['divider'].each { |prod| puts "#{prod.amount}X #{prod.range.upcase} #{prod.size} made of #{prod.material.upcase}" }
    end

    if any_double_infill_dividers?
      print "\nDOUBLE INFILL DIVIDERS:\n"
      basket['double infill divider'].each { |prod| puts "#{prod.amount}X #{prod.range.upcase} #{prod.size} made of #{prod.material.upcase}" }
    end
  end

  def get_price
    if any_fronts?
      basket['front'].each { |prod| prod.count }
    end

    if any_dividers?
      basket['divider'].each { |prod| prod.count } 
    end

    if any_double_infill_dividers?
      basket['double infill divider'].each { |prod| prod.count } 
    end

    # all_objects = basket.values.flatten
    # all_objects.each { |prod| puts }
  end

  def any_fronts?
    basket['front'].any?
  end

  def any_dividers?
    basket['divider'].any?
  end

  def any_double_infill_dividers?
    basket['double infill divider'].any?
  end
end