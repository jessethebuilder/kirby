User.destroy_all
10.times do
  User.create! email: Faker::Internet.email, password: 'Password123',
               first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
end

Post.destroy_all
100.times do
  p = Post.new(body: Faker::Lorem.paragraphs.join("\n\n"), title: Faker::Lorem.sentence)
  p.user = User.all.sample
  p.save

  Random.rand(1..10).times do
    c = Comment.new(body: Faker::Lorem.sentences.join('. '))
    c.user = User.all.sample
    c.post = p
    c.save!
  end
end
