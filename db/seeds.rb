# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ralf = User.create(name: 'Ralf')

heiligenhafen = Spot.create(name: 'Heiligenhafen', windfinder: 'https://www.windfinder.com/weatherforecast/heiligenhafen')
hansthom = Spot.create(name: 'Hanstholm', windfinder: 'https://www.windfinder.com/weatherforecast/hanstholm_fischfabrik')

Session.create(day: Date.new(2021, 12, 1), spot: hansthom, visibility: 'public', user: ralf)