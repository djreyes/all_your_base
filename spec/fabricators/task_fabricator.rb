Fabricator(:task) do
  description { Faker::Lorem.sentence(1) }
  todo_id { Fabricate(:todo) }
  created_by_id { Fabricate(:user) } #BUGBUG may need to check once we have multiple users on a project
  assigned_to_id 2
  completed_at nil
end
