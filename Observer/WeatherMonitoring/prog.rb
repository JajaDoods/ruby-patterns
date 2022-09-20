# frozen_string_literal: true

require_relative 'weather_data'
require_relative 'displays'

weather_subject = WeatherData.new

current_conditions_display = CurrentConditionsDisplay.new(weather_subject)
statistics_display = StatisticsDisplay.new(weather_subject)

weather_subject.measurements_change(36.0, 60.0, 19.0)
puts

weather_subject.measurements_change(12.0, 60.0, 8.0)
puts

weather_subject.measurements_change(70.0, 60.0, 4.0)
puts
