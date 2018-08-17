# csv_practice.rb
require 'csv'
require 'awesome_print'
require "pry"

WINNING_MEDALS = %w(Gold Silver Bronze)

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

  #ap medal_totals = medal_totals.map{|h|h.flatten}
  CSV.open(filename, "w", write_headers:true, headers:medal_totals.first.keys) do |f|
    medal_totals.each do |a|
      f << a.values
    end
  end

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)
  return olympic_data.map{|h| h["Medal"]=="Gold"? {"Name" => h["Name"], "Medal" => "GOLD"} : nil}.compact
end

# data = load_data("../data/test_athlete_events.csv")
# ap all_gold_medal_winners(load_data("../data/test_athlete_events.csv"))


def medals_sorted_by_country(medal_totals)

end

def country_with_most_medals(medal_totals)

end

def athlete_height_in_inches(olympic_data)

end
