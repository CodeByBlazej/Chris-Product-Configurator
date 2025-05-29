require_relative 'configurator/gold_range'
require_relative 'configurator/bronze_range'
require_relative 'configurator/silver_range'
require_relative 'configurator/double_infill_dividers'
require_relative 'configurator/cart'
require 'pry-byebug'
require 'colorize'

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
    puts "\nWhat product do you want to customise?\nType: FRONT, DIVIDER or DOUBLE INFILL DIVIDER".colorize(:green)
    product = gets.chomp.downcase

    until product == 'front' || product == 'divider' || product == 'double infill divider' do
      puts "Oops! Looks like typo, please type again...".colorize(:red)
      product = gets.chomp.downcase
    end

    @current_product = product
    puts "\nYou selected #{current_product.upcase} product".colorize(:yellow)
  end

  def select_range
    puts "\nWhat product range would you prefer?\nType: GOLD, SILVER or BRONZE".colorize(:green)
    range = gets.chomp.downcase

    until range == 'gold' || range =='silver' || range == 'bronze' do
      puts "Oops! Looks like typo, please type again...".colorize(:red)
      range = gets.chomp.downcase
    end

    @product_range = range
    puts "\nYou selected #{product_range.upcase} front".colorize(:yellow)
  end

  def select_size
    puts "\nWhat size of your #{current_product.upcase} do you need?\nAvailable sizes are: 8x7ft | 10x7ft | 12x7ft | 14x7ft\nType only 1st number".colorize(:green)
    size = gets.chomp.downcase

    until size == '8' || size == '10' || size == '12' || size == '14' do
      puts "Oops! Looks like typo, please type again...".colorize(:red)
      size = gets.chomp.downcase
    end

    @product_size = size + 'x7ft'
    puts "\nYou selected #{product_size.upcase}x7ft #{current_product.upcase}".colorize(:yellow)
  end

  def select_material
    puts "\nWhat material do you want your #{current_product.upcase} to be made of?\nType: SOFTWOOD or PLASTIC".colorize(:green)
    material = gets.chomp.downcase

    until material == 'softwood' || material == 'plastic' do
      puts "Oops! Looks like typo, please type again...".colorize(:red)
      material = gets.chomp.downcase
    end

    @product_material = material
    puts "\nYou selected #{product_material.upcase} material".colorize(:yellow)
  end

  def select_amount
    puts "\nHow many #{current_product.upcase}S do you need?".colorize(:green)
    amount = gets.chomp.to_i

    until amount.is_a?(Integer) do
      puts "Oops! Looks like typo, please type numbers only!".colorize(:red)
      amount = gets.chomp.to_i
    end

    @product_amount = amount
    puts "\nYou selected #{product_amount} #{current_product.upcase}S".colorize(:yellow)
  end

  def add_to_cart
    class_name = product_range.capitalize + 'Range'
    object_name = Object.const_get(class_name)
    object = object_name.new(current_product, product_range, product_size, product_material, product_amount)

    
    same_product = cart.basket[current_product].find { |object| object.size == product_size && object.material == product_material }


    if cart.basket[current_product].empty? || same_product.nil?
      cart.basket[current_product].push(object)
    elsif same_product
      same_product.amount += product_amount
    end

    cart.display

    get_price_or_continue
  end

  def get_price_or_continue
    puts "\nDo you want to add more products or get price of your current inventory?\nType: GET PRICE or CONTINUE".colorize(:green)
    answer = gets.chomp.downcase

    until answer == "get price" || answer == "continue"
      puts "Oops! Looks like typo, please type again...".colorize(:red)
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
end