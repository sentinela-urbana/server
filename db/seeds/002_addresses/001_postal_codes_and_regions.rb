# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'postal_codes.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  region = Region.find_or_create_by(code: row['postalcode'][2..4])

  postal_code = PostalCode.new
  postal_code.code = row['postalcode']
  postal_code.city = 'Caraguatatuba'
  postal_code.neighbourhood = row['neighbourhood']
  postal_code.region_id = region.id
  postal_code.save
end
