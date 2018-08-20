# csv_practice.rb
require 'csv'
require 'awesome_print'
require "pry"

WINNING_MEDALS = %w(Gold Silver Bronze)
OLYMPIC_DATA_FILENAME = '../data/athlete_events.csv'
ATHLETE_HEIGHT_IN_INCHES_FILENAME = '../data/athlete_height_in_inches.csv'
TEST_DATA_FILENAME = '../data/test_athlete_data.csv'

# Part 1 - CSV Practice
def load_data(filename)
  data = CSV.read(filename, headers:true)
  data = data.map{ |row| row.to_h }
  return data
end

def total_medals_per_country(olympic_data)

  countries = olympic_data.flat_map{|h| h["Team"]}.uniq
  total_medals = countries.map{ |v| Hash[:country, v]}
  total_medals.each { |h| h[:total_medals] = 0 }

  olympic_data.each do |h_olympic|
    if WINNING_MEDALS.include?(h_olympic["Medal"])
      country = total_medals.find {|h_medals| h_medals[:country] == h_olympic["Team"]}
      country[:total_medals] += 1
    end
  end

  return total_medals

end

def save_medal_totals(filename, medal_totals)
  CSV.open(filename, "w", write_headers:true, headers:medal_totals.first.keys) do |f|
    medal_totals.each do |h|
      f << h.values
    end
  end

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)
  return olympic_data.map{|h| h["Medal"]=="Gold"? {"Name" => h["Name"], "Medal" => "GOLD"} : nil}.compact
end

def medals_sorted_by_country(medal_totals)
  return sorted_medal_list = medal_totals.sort_by{|h|h[:country]}
end

def country_with_most_medals(medal_totals)
  return most_medals = medal_totals.max_by{|h|h[:total_medals]}
end

def athlete_height_in_inches(olympic_data)
  heights = {"Height" => 0}
  return converted_data = olympic_data.map{|h| h.merge(heights){|k,v|(v.to_i)/2.5}}
end

def save_athlete_height_in_inches(filename, converted_data)
  CSV.open(filename, "w", write_headers:true, headers:converted_data.first.keys) do |f|
    converted_data.each {|h| f << h.values}
  end
end

save_athlete_height_in_inches(ATHLETE_HEIGHT_IN_INCHES_FILENAME, athlete_height_in_inches(load_data(OLYMPIC_DATA_FILENAME)))
