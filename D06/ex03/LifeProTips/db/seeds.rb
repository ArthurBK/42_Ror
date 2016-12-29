# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all
User.create(name: 'Tutur', email: 'tutur@gmail.com',
            password_digest: 'lalalala', admin: true)
User.create(name: 'Toto', email: 'toto@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'tata', email: 'tata@gmail.com',
            password_digest: 'lalalala')
user_a = User.create(name: 'Boumboum', email: 'Boumboum@gmail.com',
            password_digest: 'lalalala')
user_b = User.create(name: 'Bimbim', email: 'Bimbim@gmail.com',
            password_digest: 'lalalala')
user_c = User.create(name: 'Woinnn', email: 'Woinnn@gmail.com',
            password_digest: 'lalalala')
User.create(name: 'Tictac', email: 'Tictac@gmail.com',
            password_digest: 'lalalala')
Post.create(user_id: user_a.id, title: 'Pouet title A', content: 'very long text A')
Post.create(user_id: user_b.id, title: 'Pouet title B', content: 'very long text b')
Post.create(user_id: user_c.id, title: 'Pouet title C', content: 'very long text c')
