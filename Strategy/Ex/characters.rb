# frozen_string_literal: true

require_relative 'weapons'

class Character
  attr_accessor :weapon

  def initialize(weapon)
    raise 'Unkown weapon' unless weapon.is_a? Weapon

    @weapon = weapon
  end

  def fight
    @weapon.use
  end
end

queen = Character.new(Bow.new)
king = Character.new(Sword.new)
knigth = Character.new(Sword.new)
troll = Character.new(Axe.new)

puts "Queen: #{queen.fight}"
puts "King: #{king.fight}"
puts "Knigth: #{knigth.fight}"
puts "Troll: #{troll.fight}"