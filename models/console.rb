require_relative('./property_tracker')
require('pry')


new_property1 = {
    'address' => '21 Codeclan Road, Inverness',
    'value' => 250000,
    'number_of_bedrooms' => 3,
    'year_built' => 2010
}

new_property2 = {
    'address' => '44 Midmills Street, Inverness',
    'value' => 300000,
    'number_of_bedrooms' => 4,
    'year_built' => 2000
}

new_property3 = {
    'address' => '16 High Street, Inverness',
    'value' => 350000,
    'number_of_bedrooms' => 4,
    'year_built' => 2000
}


property1 = Property.new(new_property1)
property2 = Property.new(new_property2)
property3 = Property.new(new_property3)

property1.save
property2.save
property3.save

property1.value = 300000
property2.number_of_bedrooms = 5
property1.update
property2.update

property3.delete

found_property = Property.find(58)
found_by_address = Property.find_by_address("44 Midmills Street, Inverness")


# all_properties = Property.all


binding.pry
nil
