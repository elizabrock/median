# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@test.com', name: 'Allison Higgenbothan', password: '1234')
User.create(email: 'test2@test.com', name: 'Aln Higgenbothan', password: '1234')
User.create(email: 'test3@test.com', name: 'Allison ggenbothan', password: '1234')
User.create(email: 'test4@test.com', name: 'Allin Higgenbothan', password: '1234')
User.create(email: 'test5@test.com', name: 'Allison Higgothan', password: '1234')
User.create(email: 'test6@test.com', name: 'Ason Hiothan', password: '1234')

Post.create(author_id: '1', title: 'Test', body: 'testing')
Post.create(author_id: '1', title: 'Test2', body: 'testing')
Post.create(author_id: '3', title: 'Test', body: 'testing')
Post.create(author_id: '4', title: 'Test', body: 'testing')
Post.create(author_id: '5', title: 'Test', body: 'testing')
