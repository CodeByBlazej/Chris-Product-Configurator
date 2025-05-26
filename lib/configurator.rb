require_relative 'configurator/gold_range'
require_relative 'configurator/bronze_range'
require_relative 'configurator/silver_range'
require_relative 'configurator/double_infill_dividers'
require_relative 'configurator/cart'
require 'pry-byebug'

class Configurator
  attr_reader :product_range, :product_size, :product_material, :current_product, :product_amount, :cart
  
  def initialize
    @product_range = nil
    @product_size = nil
    @product_material = nil
    @current_product = nil
    @product_amount = nil
    create_cart
  end

  def configure_product
    select_product
    select_range
    select_size
    select_material
    select_amount
    add_to_cart
  end

  def select_product
    puts 'What product do you want to customise? Type FRONT, DIVIDER or DOUBLE INFILL DIVIDER'
    product = gets.chomp.downcase

    until product == 'front' || product == 'divider' || product == 'double infill divider' do
      puts "Oops! Looks like typo, please type again..."
      product = gets.chomp.downcase
    end

    @current_product = product
    puts "You selected #{current_product.upcase} product"
  end

  def select_range
    puts 'What product range would you prefer? Type GOLD, SILVER or BRONZE'
    range = gets.chomp.downcase

    until range == 'gold' || range =='silver' || range == 'bronze' do
      puts "Oops! Looks like typo, please type again..."
      range = gets.chomp.downcase
    end

    @product_range = range
    puts "You selected #{product_range.upcase} front"
  end

  def select_size
    puts "What size of your #{current_product.upcase} do you need?\nAvailable sizes are: 8x7ft | 10x7ft | 12x7ft | 14x7ft\nType only 1st number"
    size = gets.chomp.downcase

    until size == '8' || size == '10' || size == '12' || size == '14' do
      puts "Oops! Looks like typo, please type again..."
      size = gets.chomp.downcase
    end

    @product_size = size + 'x7ft'
    puts "You selected #{product_size.upcase}x7ft #{current_product.upcase}"
  end

  def select_material
    puts "What material do you want your #{current_product.upcase} to be made of? Type SOFTWOOD or PLASTIC"
    material = gets.chomp.downcase

    until material == 'softwood' || material == 'plastic' do
      puts "Oops! Looks like typo, please type again..."
      material = gets.chomp.downcase
    end

    @product_material = material
    puts "You selected #{product_material.upcase} material"
  end

  def select_amount
    puts "How many of #{current_product.upcase}S do you need?"
    amount = gets.chomp.to_i

    until amount.is_a?(Integer) do
      puts "Oops! Looks like typo, please type numbers only!"
      amount = gets.chomp.to_i
    end

    @product_amount = amount
    puts "You selected #{product_amount} #{current_product.upcase}S"
  end

  def add_to_cart
    class_name = product_range.capitalize + 'Range'
    object_name = Object.const_get(class_name)
    object = object_name.new(current_product, product_range, product_size, product_material, product_amount)

    
    same_product = cart.basket[current_product].find { |object| object.size == product_size && object.material == product_material }
    # binding.pry


    if cart.basket[current_product].empty? || same_product.nil?
      cart.basket[current_product].push(object)
      # add_to_cart
    elsif same_product
      same_product.amount += product_amount
    end

    # binding.pry
    cart.display

    get_price_or_continue

    # configure_product
  end

  def get_price_or_continue
    puts "\nDo you want to add more products or get price of your current inventory? Type GET PRICE or CONTINUE"
    answer = gets.chomp.downcase

    until answer == "get price" || answer == "continue"
      puts "Oops! Looks like typo, please type again..."
      answer = gets.chomp.downcase
    end

    if answer == "get price"
      cart.get_price
    else
      configure_product
    end
  end

  def create_cart
    @cart = Cart.new
  end

  def add_product_to_cart
    class_name = product_range.capitalize + 'Range'
    object_name = Object.const_get(class_name)
    object = object_name.new(current_product, product_size, product_material, product_amount)
    p object 
    cart.push(object)
    p cart

    #add object to hash. key would be number of product added to basket
    #{1: [size = 8, material = plastic, amount = 2]} if another object variables would math product in the basket just change amount = DOING THAT I CAN'T ADD AMOUNT TO THE OBJECT
  end

  # 1st select range
  # 2nd select size
  # 3rd select material
  # 4th select amount
  # ask user if he wants to add more fronts
  # if he picks the same fronts again tell him how many he has
  # and if he wants to ??????

end