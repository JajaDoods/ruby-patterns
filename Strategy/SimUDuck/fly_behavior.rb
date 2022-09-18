# frozen_string_literal: true

class FlyBehavior
  def fly
    raise NotImplementedError
  end
end

class FlyWithWings < FlyBehavior
  def fly
    "I'm flying with wings!!"
  end
end

class NoFly < FlyBehavior
  def fly
    "I can't fly"
  end
end

class FlyWithJetpack < FlyBehavior
  def fly
    "I'm flying with jetpack!!"
  end
end
