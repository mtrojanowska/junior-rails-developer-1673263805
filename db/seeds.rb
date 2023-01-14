# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times do
#   Category.create!( title: Faker::Lorem.words(number: 2) )   
# end  

# 3.times do

# author = Author.create!( nickname: Faker::Name.first_name, email: Faker::Internet.email,
#          password: Faker::Internet.password(min_length: 26, max_length: 26, mix_case: true),
#          encrypted_password: Faker::Internet.password(min_length: 26, max_length: 26, mix_case: true) )
    
   
# category = []
#   3.times do
#      category << Category.create!( title: Faker::Lorem.words(number: 2) )   
#     end  
    
#     post = Post.new( title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.sentences(number:5),
#     published_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), author_id: author.id  )    
#     post.categories << category
#     post.save

    load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))

end