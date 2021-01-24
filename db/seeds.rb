# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# tech = Interest.create(field_of_interest:'Software development')
# edu = Interest.create(field_of_interest:'Education')
# sc = Interest.create(field_of_interest:'Sciences')
# ent = Interest.create(field_of_interest:'Enterteinment')

posts_interests = [
    'Sciences','Medicine','Business & Finance','Arts & Humanity','Music','Philosophy','Theology & Religious Sciences','Social Sciences','Nursing','Science and Engineering',
    'Educational Sciences','Agriculture and Food Sciences','Sciences of Administration','Geography and Geomatics','Computer Sciences','Veterinary Medicine']

posts_interests.sort.each do |interests|
    Interest.create!(:field_of_interest => interests)
end
