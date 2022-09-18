# frozen_string_literal: true

class Weapon
  def use
    raise NotImplementedError
  end
end

class Knife < Weapon
  def use
    'Fight with knife'
  end
end

class Sword < Weapon
  def use
    'Fight with sword'
  end
end

class Bow < Weapon
  def use
    'Fight with bow and arrows'
  end
end

class Axe < Weapon
  def use
    'Fight with axe'
  end
end
