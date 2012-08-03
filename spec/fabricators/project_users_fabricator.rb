Fabricator(:project_users) do
  user_id { Fabricate(:user) }
  project_id { Fabricate(:project) }
  is_admin { true }
end

Fabricator(:project_user_admin, from: :project_users) do
  project_id { 1 }
  is_admin { true }
end

Fabricator(:project_user_member, from: :project_users) do
  project_id { 1 }
  is_admin { nil }
end