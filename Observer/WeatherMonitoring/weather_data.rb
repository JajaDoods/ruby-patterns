# frozen_string_literal: true

require 'class_interface'

require_relative 'displays'

module IWeatherSubject
  def addDisplay(sensor)
    raise NotImplementedError
  end

  def removeDisplay(sensor)
    raise NotImplementedError
  end

  def notifyDisplays
    raise NotImplementedError
  end
end

class WeatherData
  include IWeatherSubject

  attr_reader :temperature, :humidity, :pressure

  def initialize
    @displays = []
  end

  def measurements_change(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure

    notifyDisplays
  end

  # IWeatherSubjet implementation
  def addDisplay(sensor)
    raise ArgumentError, 'The sensor must implement DisplayObserver module' unless sensor.class.include?(IDisplayObserver)

    @displays << sensor
  end

  def removeDisplay(sensor)
    @displays.delete sensor
  end

  def notifyDisplays
    @displays.each { |display| display.update }
  end
end
