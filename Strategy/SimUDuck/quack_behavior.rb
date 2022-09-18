# frozen_string_literal: true

class QuackBehavior
  def quack
    raise NotImplementedError
  end
end

# эти умеют крякать
class Quack < QuackBehavior
  def quack
    'Quack.. quack'
  end
end

# эти утки умеют пищать
class Squeak < QuackBehavior
  def quack
    'Squeak.. squeak'
  end
end

# эти не умеют пищать
class Silent
  def quack
    'Silent'
  end
end