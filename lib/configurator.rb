class Configurator
  attr_reader :front_range_selected,
  
  def initialize
    @front_range_selected = nil
  end

  def configure_product
    select_fronts
  end

  def select_fronts
    puts 'Select the range of fronts by typing: gold, silver or bronze'
    front_range = gets.chomp.downcase

    until front_range == 'gold' || front_range =='silver' || front_range == 'bronze' do
      puts "Oops! Looks like typo, please type again..."
      front_range = gets.chomp.downcase
    end

    @front_range_selected = front_range
    puts "Good choice! You selected #{front_range_selected.upcase} front"
  end


end