require 'awesome_print'

# STATE CAPITALS
states = {
  'Oregon' => 'OR',
  'Alabama' => 'AL',
  'New Jersey' => 'NJ',
  'Colorado' => 'CO'
}

capitals = {
  'OR' => 'Salem',
  'AL' => 'Montgomery',
  'NJ' => 'Trenton',
  'CO' => 'Denver'
}

# Level 1: Write some code which given a state name (“Alabama”) outputs the state abbreviation
states['Alabama']

# Level 2: Write some code which given a state name (“Oregon”) outputs its capital (“Salem”)
capitals[states['Oregon']]

# Level 3: Handle the case when a state’s information is not known by returning “Unknown”
# states.fetch('Massachusetts', 'Unknown')
states.default = 'Unknown'
states[:massachusetts]
states[:alaska]

# Level 4: Let’s go the other way. Given a capital name (“Denver”), return the state name for which it is the capital (“Colorado”)
states.key(capitals.key('Denver'))

# Level 5: Write some code to turn these two hashes into one nested hash which looks like this:
# state_info = {
#   'Oregon' => { abbreviation: 'OR', capital: 'Salem' },
#   'Alabama' => { abbreviation: 'AL', capital: 'Montgomery' },
#   'New Jersey' => { abbreviation: 'NJ', capital: 'Trenton' },
#   'Colorado' => { abbreviation: 'CO', capital: 'Denver' }
# }

state_info = states.each_with_object({}) do |key_val, state_info_hash|
  key = key_val[0]
  state_info_hash[key] = {}
  state_info_hash[key][:abbreviation] = states[key]
  state_info_hash[key][:capital] = capitals[states[key]]
end
