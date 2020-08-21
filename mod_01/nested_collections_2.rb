require 'awesome_print'

# AGE ORDERING
ages = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan', 24],
  ['Dom', 32],
  ['Steve', 24],
  ['Jill', 24]
]

# Level 1: Write code that’ll output the ages (and only the ages) for the data set
ages.each { |arr| p arr[1] }

# Level 2: Write code that’ll output the names (and only the names) in order by ascending age
sort_names_by_age = ages.sort_by { |arr| arr[1] }.each { |person| person[0] }

# Level 3: Output the name with the age, like Juan (24)
sort_names_by_age = ages.sort_by { |arr| arr[1] }.each { |person| p "#{person[0]} (#{person[1]})" }

# Level 4: Write code to automatically build a hash with the age as the key and an array of names as the value (all the people who are that age).
# e.g. {24 => ['Juan', 'Steve', 'Jill']...}

age_hash = sort_names_by_age.each_with_object({}) do |person_arr, hash|
  age = person_arr[1]
  name = person_arr[0]
  hash[age] ? hash[age] << name : hash[age] = [name]
end
