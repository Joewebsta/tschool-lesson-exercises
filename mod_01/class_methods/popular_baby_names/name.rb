require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    @year = 
    @bio_gender = 
    @ethnicity = 
    @name = 
    @count = 
    @rank = 
  end

  def self.find_by_name(name)
    rows = CSV.read(@@filename, headers: true)
    result = []
    
    # new code goes here
    
    result
  end
end


@@filename = 'Popular_Baby_Names.csv'
rows = CSV.read(@@filename, headers: true)
pp rows