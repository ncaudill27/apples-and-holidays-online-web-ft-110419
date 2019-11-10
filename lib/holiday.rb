require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring =>{
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash.dig(:summer, :fourth_of_july)[1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |memo, key|
    if memo == :winter
      key.each { |key, value| value << supply }
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |memo, key|
    if memo == :spring
      key.each { |key, value| value << supply }
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  new_holiday = { holiday_name => supply_array }
  holiday_hash[season].merge!(new_holiday)
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize}:"
    holidays.each do |holiday, supplies|
      holiday_text = holiday.to_s.split("_").collect{|i|i.capitalize}.join(" ")
      puts "  #{holiday_text}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays = []
  holiday_hash.each do |season, data|
    binding.pry
    if holiday_hash.dig(season, data.keys).include?("BBQ")
      bbq_holidays << season
    end
  end
bbq_holidays
end







