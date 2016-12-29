# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create(name: 'Toto', email: 'toto@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'tata', email: 'tata@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'Boumboum', email: 'Boumboum@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'Bimbim', email: 'Bimbim@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'Woinnn', email: 'Woinnn@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'Tictac', email: 'Tictac@gmail.com',
            password_digest: 'lalalala')