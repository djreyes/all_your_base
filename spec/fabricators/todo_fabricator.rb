Fabricator(:todo) do
  name { Faker::Lorem.words(1) }
  project_id { Fabricate(:project) }
  created_by_id { Fabricate(:user) } #BUGBUG may need to check once we have multiple users on a project
end
