# frozen_string_literal: true

require 'class_interface'

require_relative 'weather_data'

module IDisplayObserver
  def update
    raise NotImplementedError
  end
end

module IDisplayElement
  def display
    raise NotImplementedError
  end
end

class CurrentConditionsDisplay
  include IDisplayObserver, IDisplayElement

  def initialize(weather_subject)
    raise ArgumentError, 'Invalid weather subject' unless weather_subject.class.include?(IWeatherSubject)

    @weather_subject = weather_subject
    @weather_subject.addDisplay(self)
  end

  def update
    @temperature = @weather_subject.temperature
    @humidity = @weather_subject.humidity
    @pressure = @weather_subject.pressure

    display
  end

  def display
    puts 'Current Conditions'.center(40, '=')
    puts "Temperature: #{@temperature}",
         "Humidity: #{@humidity}",
         "Pressure: #{@pressure}"
  end
end

class StatisticsDisplay
  include IDisplayObserver, IDisplayElement

  def initialize(weather_subject)
    raise ArgumentError, 'Invalid weather subject' unless weather_subject.class.include?(IWeatherSubject)

    @weather_subject = weather_subject
    @weather_subject.addDisplay(self)

    @temperatures = []
    @humidities = []
    @pressures = []
  end

  def update
    @temperatures << @weather_subject.temperature
    @humidities << @weather_subject.humidity
    @pressures << @weather_subject.pressure

    display
  end

  def display
    puts 'Statistics [Average]'.center(40, '=')
    puts "Temperature: #{@temperatures.sum / @temperatures.size}",
         "Humidity: #{@humidities.sum / @humidities.size}",
         "Pressure: #{@pressures.sum / @pressures.size}"
  end
end
