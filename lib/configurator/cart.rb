class Cart
  attr_reader :basket
  
  def initialize
    @basket = {
      'front' => [],
      'divider' => []
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
  end

  def get_price
    if any_fronts?
      basket['front'].each { |prod| prod.count }
    end

    if any_dividers?
      basket['divider'].each { |prod| prod.count } 
    end
  end

  def any_fronts?
    basket['front'].any?
  end

  def any_dividers?
    basket['divider'].any?
  end
end