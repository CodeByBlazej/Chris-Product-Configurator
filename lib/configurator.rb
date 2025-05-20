class Configurator
  attr_reader :front_range_selected
  
  def initialize
    @front_range_selected = nil
    @front_size = nil
    @divider_size = nil
    @front_material = nil
    @divider_material = nil
    @current_product = nil
  end

  def configure_product
    select_fronts
    select_size
    select_material
  end

  def select_fronts
    puts 'Select the range of fronts by typing: gold, silver or bronze'
    front_range = gets.chomp.downcase

    until front_range == 'gold' || front_range =='silver' || front_range == 'bronze' do
      puts "Oops! Looks like typo, please type again..."
      front_range = gets.chomp.downcase
    end

    @front_range_selected = front_range
    @current_product = 'front'
    puts "Good choice! You selected #{front_range_selected.upcase} front"
  end

  def select_size
    puts 'What size of them do you need?/n Available sizes are: 8x7ft | 10x7ft | 12x7ft | 14x7ft/n Type only 1st number'
    size = gets.chomp.downcase

    until size == '8' || size == '10' || size == '12' || size == '14' do
      puts "Oops! Looks like typo, please type again..."
      size = gets.chomp.downcase
    end

    @current_product == 'front' ? @front_size = size : @divider_size = size
    puts "Good choice! you selected #{size.upcase}x7ft divider"
  end

  def select_material
    puts "What material do you want your #{@current_product} to be made of? You can select softwood or plastic."
    material = gets.chomp.downcase

    until material == 'softwood' || material == 'plastic' do
      puts "Oops! Looks like typo, please type again..."
      material = gets.chomp.downcase
    end

    @current_product == 'front' ? @front_material = material : @divider_material = material
    puts "Good choice! you selected #{material.upcase} material"
  end

  # 1st select range
  # 2nd select size
  # 3rd select material
  # 4th select amount
  # ask user if he wants to add more fronts
  # if he picks the same fronts again tell him how many he has
  # and if he wants to ??????

end