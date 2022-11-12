# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    puts 'Destroying tables...'
    Cat.destroy_all

    puts 'Resetting PK sequences...'
    %w(cats).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts 'Creating data...'
    c1 = Cat.create!(name: 'Dog', color: 'white', sex: 'M', birth_date: '2021/03/14', description: 'funny guy')
    c2 = Cat.create!(name: 'Birdie', color: 'black', sex: 'F', birth_date: '2018/02/20', description: 'party animal')
    c3 = Cat.create!(name: 'Frank', color: 'brown', sex: 'M', birth_date: '2019/12/25', description: 'loves to nap')
    c4 = Cat.create!(name: 'Pasqualo', color: 'orange', sex: 'F', birth_date: '2017/11/18', description: 'fickle')
    c5 = Cat.create!(name: 'Julia', color: 'black', sex: 'F', birth_date: '2020/05/21', description: 'cool headed')

    puts 'Done!'
end
