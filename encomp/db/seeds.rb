# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

igor = User.new(name: "Igor Sant'ana", email: "igorba2005@gmail.com", password: "123456", admin: true)
igor.save
encomp = User.new(name: "Encomp Oficial", email: "contato@encomp.com.br", password: "encomp_oficial2016!", admin: true)
encomp.save

Course.create([
  {name: "Ruby On Rails", desc: "", day: Date.new(2016, 9, 20)},
  {name: "Git", desc: "", day: Date.new(2016, 9, 20)},
  {name: "Robótica", desc: "", day: Date.new(2016,9,22)},
  {name: "Aprendizado de Máquina", desc: "", day: Date.new(2016,9,22)},
  {name: "Linux", desc: "", day: Date.new(2016,9,22)},
  ])
