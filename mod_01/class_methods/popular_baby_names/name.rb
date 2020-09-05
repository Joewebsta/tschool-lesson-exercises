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

  def self.find_by_year(year)
    rows = CSV.foreach(@@filename, headers: true, header_converters: :symbol)
    rows.map { |row| Name.new(row) }.select { |row| row.year == year }
  end

  def self.where(data)
    rows = CSV.foreach(@@filename, headers: true, header_converters: :symbol)
    rows.select { |row| row[data.keys[0]] == data.values[0] }.map { |row| Name.new(row) }
  end
end

# pp Name.find_by_name('Ian')
# pp Name.find_by_year('2014')
# pp Name.where({ rank: '15' }).count
# pp Name.where({ gender: 'FEMALE' }).count
# pp Name.where({ ethnicity: 'BLACK NON HISPANIC' }).count
