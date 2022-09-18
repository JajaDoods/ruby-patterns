# frozen_string_literal: true

require_relative 'fly_behavior'
require_relative 'quack_behavior'

class Duck
  def swim
    "I'm swimming!"
  end

  def display
    raise NotImplementedError
  end

  def fly
    @fly_behavior.fly
  end

  def quack
    @quack_behavior.quack
  end
end

class MallardDuck < Duck
  def initialize
    @fly_behavior = FlyWithWings.new
    @quack_behavior = Quack.new
  end

  def display
    "I'm a Mallard Duck!!"
  end
end

class RedheadDuck < Duck
  def initialize
    @fly_behavior = FlyWithWings.new
    @quack_behavior = Quack.new
  end

  def display
    "I'm a Readhead Duck!!"
  end
end

class RubberDuck < Duck
  def initialize
    @fly_behavior = NoFly.new
    @quack_behavior = Squeak.new
  end

  def display
    "I'm a Rubber Duck!!"
  end
end

class DecoyDuck < Duck
  def initialize
    @fly_behavior = NoFly.new
    @quack_behavior = Silent.new
  end

  def display
    "I'm a Decoy Duck"
  end
end

binding.irb