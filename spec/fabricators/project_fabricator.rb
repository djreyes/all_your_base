Fabricator(:project) do
  name { Faker::Lorem.words(1) }
  description { Faker::Lorem.sentence(4) }
  owner_id { Fabricate(:user) }
end
