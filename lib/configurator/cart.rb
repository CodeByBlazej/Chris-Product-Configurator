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
    all_objects = basket.values.flatten
    all_objects.each { |prod| prod.count }

    total_gross = 0
    total_net = 0
    total_vat = 0

    all_objects.each do |prod| 
      total_gross += prod.price
      total_net += prod.net_price
      total_vat += prod.vat 
    end

    puts "\nTotal price for everything is:\nGROSS: #{total_gross.round(2)} NET: #{total_net.round(2)} VAT: #{total_vat.round(2)}"
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