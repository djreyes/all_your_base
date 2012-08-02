Fabricator(:todo) do
  name { Faker::Lorem.words(1) }
  project_id { Fabricate(:project) }
  created_by_id { Fabricate(:user) }#BUGBUG may need to check once we have multiple users on a project
end

# Fabricator(:todo_from_project, from: :project) do
#   todo(count: 1) {|project, index| Fabricate(:todo, project: project, created_by_id: project.owner_id) }
#   #
#   # name { Faker::Lorem.words(1) }
#   # project_id { project.id }
#   # created_by_id { project.owner_id } #BUGBUG may need to check once we have multiple users on a project
# end
