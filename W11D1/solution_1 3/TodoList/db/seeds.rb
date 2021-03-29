# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

todos = Todo.create([
  { title: 'learn what a thunk is', body: 'preferably soon', done: false},
  { title: 'start full-stack project', body: 'start it tonight', done: false},
  { title: 'pick up bagels', body: 'also cream cheese or whatever else people eat on bagels', done: false},
  { title: 'learn how to make pizza', body: 'we may need a brick oven as well', done: false},
  { title: 'learn to do the splits', body: 'it may take a couple years', done: false}
])