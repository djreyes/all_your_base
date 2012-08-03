Fabricator(:project) do
  name { Faker::Lorem.words(1) }
  description { Faker::Lorem.sentence(4) }
  owner_id { Fabricate(:user) }
end

# Fabricator(:project_with_roster, from: :project) do
#   name { Faker::Lorem.words(1) }
#   description { Faker::Lorem.sentence(4) }
#   owner_id { Fabricate(:user) }
# end


# Fabricator(:project_with_todo, from: :project) do
#     todo { Fabricate(:todo, created_by_id: 1) }
# end