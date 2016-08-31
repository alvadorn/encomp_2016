# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

igor = User.new(name: "Igor Sant'ana", email: "igorba2005@gmail.com", password: "123456", admin: true,
 cpf: "1", phone: "1", university: "1", course: "1")
igor.save
encomp = User.new(name: "Encomp Oficial", email: "contato@encomp.com.br", password: "encomp_oficial2016!", admin: true,
 cpf: "1", phone: "1", university: "1", course: "1")
encomp.save

Course.create([
  {name: "Ruby On Rails", desc: "", day: Date.new(2016, 9, 20), value: 10.0, vacancies: 25},
  {name: "Git", desc: "", day: Date.new(2016, 9, 20), value: 10.0, vacancies: 25},
  {name: "Robótica", desc: "", day: Date.new(2016,9,22), value: 20.0, vacancies: 10},
  {name: "Aprendizado de Máquina", desc: "", day: Date.new(2016,9,22), value: 15.0, vacancies: 25},
  {name: "Linux", desc: "", day: Date.new(2016,9,22), value: 15.0, vacancies: 25},
  {name: "Torneio de Programação", day: Date.new(2016,9,21), value: 10.0, vacancies: 30},
  {name: "Visita técnica", day: Date.new(2016,9,21), value: 20.0, vacancies: 40}

  ])
