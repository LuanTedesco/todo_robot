# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'admin@admin.com', password: '123456',  password_confirmation: '123456')

Tag.create(id: 1, name: 'Fiscal', user_id: 1)
Tag.create(id: 2, name: 'Rh', user_id: 1)
Tag.create(id: 3, name: 'Societario', user_id: 1)

Task.create(title: 'Tarefa 1', description: 'Tarefa 1', start_date: Date.today, end_date: Date.today, priority: :low, status: :waiting, typetask: :task, finished: false, tag_ids: [1,2,3], user_id: 1)