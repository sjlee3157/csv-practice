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

def total_medals_per_country(olympic_data)

end

def save_medal_totals(filename, medal_totals)

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

end

def metals_sorted_by_country(metal_totals)

end

def country_with_most_medals(metal_totals)

end

def athlete_height_in_inches(olympic_data)

end
