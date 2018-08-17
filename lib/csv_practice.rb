# csv_practice.rb
require 'csv'
require 'awesome_print'
require "pry"

# Part 1 - CSV Practice
def load_data(filename)
  data = CSV.read(filename, headers:true)
  data = data.map{ |row| row.to_h }
  return data
end

#data = load_data("../data/test_athlete_events.csv") #Remove Before Flight

def total_medals_per_country(olympic_data)
  # a of h to a of h
  # each hash truncated to 2 keys
  # new key :total_medals => 0 default
  # keep only key :country, which used to be :team
  # h[:total_medals] += 1 if h[:medal] is G, S, or B.

  # write spec: all values in :medal are G, S, B, or NA
  # write spec: all values in :team has string.size > 0 && < 10
  return medals #a of h
end

def save_medal_totals(filename, medal_totals)

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

end

def medals_sorted_by_country(medal_totals)

end

def country_with_most_medals(medal_totals)

end

def athlete_height_in_inches(olympic_data)

end
