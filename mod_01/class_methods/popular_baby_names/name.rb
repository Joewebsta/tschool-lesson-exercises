require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name]
    @count = data[:count].to_i
    @rank = data[:rank].to_i
  end

  def self.find_by_name(name)
    rows = CSV.foreach(@@filename, headers: true, header_converters: :symbol)
    rows.map { |row| Name.new(row) }.select { |row| row.name.downcase == name.downcase }
  end
end

pp Name.find_by_name('Ian')
