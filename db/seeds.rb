User.create!(email: 'demo@demo.com', name: 'Demo', password: '12345678', role: 'user')

puts 'Create some data...'
3.times do |site_index|
  User.find_by(email: 'demo@demo.com').sites.create(url: "site#{site_index}.ru")
  10.times do |query_index|
    15.times do |day|
      Site.find_by(url: "site#{site_index}.ru").queries.create(word: "query#{query_index}-#{site_index}")
      Query.find_by(word: "query#{query_index}-#{site_index}").positions.create(place: rand(1..20), created_at: Date.today - day)
    end
  end
end

